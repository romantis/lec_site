module Routing exposing (..)

import Navigation
import UrlParser exposing (..)


type Route
    = NotFoundRoute 
    | HomeRoute
    | AboutRoute
    | FAQRoute


routeString : Route -> String
routeString route =
    case route of 
        HomeRoute ->
            "home"
        AboutRoute ->
            "about"
        FAQRoute ->
            "faq"
        _ ->
            ""
        

route : Parser (Route -> c) c
route =
    oneOf
        [ map HomeRoute top
        , map HomeRoute (s "home")
        , map AboutRoute (s "about")
        , map FAQRoute (s "faq")
        ]


parser : Navigation.Location -> Route
parser location =
     case parseHash route location of
        Just route ->
            route

        Nothing ->
            NotFoundRoute    