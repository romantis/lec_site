module Routing exposing (..)

import Url exposing (..)
import Url exposing (Url)
import Url.Parser exposing (..)

type Route
    = NotFoundRoute 
    | Meetings
    | Meeting String
    | AboutRoute
    | FAQRoute


routeString : Route -> String
routeString route =
    case route of 
        Meetings -> 
            "meetings"

        Meeting slug -> 
            "meetings/" ++ slug

        AboutRoute -> 
            "about"

        FAQRoute -> 
            "faq"

        _ -> ""
        

matches : Parser (Route -> c) c
matches =
    oneOf
        [ map Meetings top
        , map Meetings (s "meetings")
        , map Meeting (s "meetings" </> string)
        , map AboutRoute (s "about")
        , map FAQRoute (s "faq")
        ]


parser : Url -> Route
parser url =
     case parse matches url of
        Just route ->
            route

        Nothing ->
            NotFoundRoute    