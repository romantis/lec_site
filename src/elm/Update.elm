module Update exposing (..)

import Browser
import Browser.Dom as Dom
import Browser.Navigation as Nav exposing (Key)
import Task
import Url exposing (Url)
import Commands exposing (getPageMD)
import Dict
import Helpers.Main exposing (getLangs)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Routing



update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model
            , Cmd.none
            )

        LocationUpd urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Nav.pushUrl model.key (Url.toString url)
                    )

                Browser.External url ->
                    ( model
                    , Nav.load url
                    )



        Navigate url ->
            let
                newRoute =
                    Routing.parser url
                        |> Debug.log ""
                
                pageString =
                    Routing.routeString newRoute
                        |> Debug.log ""
                
                cmd =
                    if
                        List.member pageString (Dict.keys model.content)
                            && String.isEmpty (Maybe.withDefault "" (Dict.get pageString model.content))
                    then
                        getPageMD pageString
                    else
                        Cmd.none
            in
            ( { model | route = newRoute }
            , cmd
            )


        GotMeetings xs ->
            let
                meetings =
                    xs
                        |> List.sortBy .day
                        |> List.filter ((/=) 0 << .day)
                     
            in
            ({ model
                | meetings = meetings
                , languages = getLangs xs
            }
            , Cmd.none
            )


        ShowMap pid ->
            let 
                updShowMap =
                    if pid /= model.shownMap then pid else ""
            in
            ({ model | shownMap = updShowMap }
            , Cmd.none
            )


        FilterLang lang ->
            let
                uplang = 
                    if lang == "All" || String.isEmpty lang then "" else lang
            in
            ({ model | selectedLang = uplang } 
            , Cmd.none
            )


        GetMD mdName (Ok md) ->
            ( { model | content = Dict.insert mdName md model.content }
            , Cmd.none
            )


        GetMD mdName (Err err) ->
            -- let
            --     _ =
            --         Debug.log ("Faild to load " ++ mdName ++ ".md") err
            -- in
            ( model
            , Cmd.none
            )


        NowDate date ->
            ({ model | date = date }
            , Cmd.none
            )

-- jumpToBottom : String -> Cmd Msg
-- jumpToBottom id =
--   Dom.getViewportOf id
--     |> Task.andThen (\info -> Dom.setViewportOf id 0 info.scene.height)
--     |> Task.perform (\_ -> NoOp)
