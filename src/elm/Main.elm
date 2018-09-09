module Main exposing (main)

import Browser
import Commands exposing (getPageMD)
import Time
import Dict
import List
import Messages exposing (Msg(..))
import Models exposing (Model, initialModel)
import Ports
import Routing exposing (Route(..), routeString)
import Task
import Update exposing (update)
import View exposing (view)
import Url exposing (Url)
import Browser.Navigation as Nav exposing (Key)

type alias Flags =
    {}

init : Flags -> Url -> Key -> ( Model, Cmd Msg )
init flags url key =
    let
        currentRoute =
            Routing.parser url

        model =
            initialModel currentRoute key

        pageString =
            Routing.routeString currentRoute

        nowDateCmd =
            Task.perform NowDate Time.now

        pageMdCmd =
            if List.member pageString (Dict.keys model.content) then
                getPageMD pageString
            else
                Cmd.none
    in
    ( model
    , Cmd.batch [ nowDateCmd, pageMdCmd ]
    )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Ports.meetings GotMeetings


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = LocationUpd
        , onUrlChange = Navigate
        }
