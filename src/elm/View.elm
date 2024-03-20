module View exposing (view)

import Dict
import Browser
import Html exposing (..)
import Html.Attributes exposing (class, target, href)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Routing exposing (Route(..), routeString)
import Views.Footer as Footer
import Views.Header as Header
import Views.HomePage as Home
import Views.MDPage as MDPage
import Views.Notfound as Notfound


view : Model -> Browser.Document Msg
view model =
    { title = "LEC"
    , body =
        [ Header.view model.route model.navItems
        , page model
        , Footer.view  model.date
        ]
    }


page : Model -> Html Msg
page model =
    case model.route of
        -- HomeRoute ->
        --     Home.view model
        
        Meetings ->
            Home.view model

        Meeting _ ->
            Home.view model

        AboutRoute ->
            MDPage.view (Maybe.withDefault "" (Dict.get (routeString model.route) model.content))

        FAQRoute ->
            MDPage.view (Maybe.withDefault "" (Dict.get (routeString model.route) model.content))

        NotFoundRoute ->
            Notfound.view
