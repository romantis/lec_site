module Update exposing (..)

import Commands exposing (getPageMD)
import Dict
import Helpers.Main exposing (getLangs)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Navigation
import Routing


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LocationUpd location ->
            let
                currentRoute =
                    Routing.parser location

                pageString =
                    Routing.routeString currentRoute

                cmds =
                    if
                        List.member pageString (Dict.keys model.content)
                            && String.isEmpty (Maybe.withDefault "" (Dict.get pageString model.content))
                    then
                        [ getPageMD pageString ]
                    else
                        []
            in
            { model | route = currentRoute } ! cmds

        Navigate url ->
            model ! [ Navigation.newUrl url ]

        GotMeetings xs ->
            let
                meetings =
                    List.sortBy .day xs
            in
            { model
                | meetings = meetings
                , languages = getLangs xs
            }
                ! []

        ShowMap pid ->
            if pid /= model.shownMap then
                { model | shownMap = pid } ! []
            else
                { model | shownMap = "" } ! []

        FilterLang lang ->
            if lang == "All" || String.isEmpty lang then
                { model | selectedLang = "" } ! []
            else
                { model | selectedLang = lang } ! []

        GetMD mdName (Ok md) ->
            ( { model | content = Dict.insert mdName md model.content }
            , Cmd.none
            )

        GetMD mdName (Err err) ->
            let
                _ =
                    Debug.log ("Faild to load " ++ mdName ++ ".md") err
            in
            ( model, Cmd.none )

        NowDate date ->
            { model | date = date } ! []
