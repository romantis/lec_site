module Main exposing (main)

import Commands exposing (getPageMD)
import Date
import Dict
import List
import Messages exposing (Msg(..))
import Models exposing (Model, initialModel)
import Navigation exposing (Location)
import Ports
import Routing exposing (Route(..), routeString)
import Task
import Update exposing (update)
import View exposing (view)


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parser location

        model =
            initialModel currentRoute

        pageString =
            Routing.routeString currentRoute

        nowDateCmd =
            [ Task.perform NowDate Date.now ]

        pageMdCmd =
            if List.member pageString (Dict.keys model.content) then
                [ getPageMD pageString ]
            else
                []
    in
    model ! List.concat [ nowDateCmd, pageMdCmd ]


subscriptions : Model -> Sub Msg
subscriptions _ =
    Ports.meetings GotMeetings


main : Program Never Model Msg
main =
    Navigation.program LocationUpd
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
