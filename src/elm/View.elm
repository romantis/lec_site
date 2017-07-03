module View exposing (view)

import Date
import Dict
import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Routing exposing (Route(..), routeString)
import Views.Footer as Footer
import Views.Header as Header
import Views.HomePage as Home
import Views.MDPage as MDPage
import Views.NotFound as NotFound


view : Model -> Html Msg
view model =
    div [ class "" ]
        [ Header.view model.route model.navItems
        , page model
        , Footer.view <| Date.year model.date
        ]


page : Model -> Html Msg
page model =
    case model.route of
        HomeRoute ->
            Home.view model

        AboutRoute ->
            MDPage.view (Maybe.withDefault "" (Dict.get (routeString model.route) model.content))

        FAQRoute ->
            MDPage.view (Maybe.withDefault "" (Dict.get (routeString model.route) model.content))

        NotFoundRoute ->
            NotFound.view
