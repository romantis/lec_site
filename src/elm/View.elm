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
import Views.NotFound as NotFound


view : Model -> Browser.Document Msg
view model =
    { title = "LEC"
    , body =
        [ div [ class "ls-covid19"] 
            [ p [] [ text "Due to COVID-19 pandemic, all live meetings are stopped."]
            , p [] 
                [ text "Check out our "
                , a [ href "https://www.facebook.com/groups/82542151162/", target "_blank" ] [ text "facebook"]
                , text " for information about online meetings."
                ]
            
        ]
        , Header.view model.route model.navItems
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
            NotFound.view
