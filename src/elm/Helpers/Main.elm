module Helpers.Main exposing (..)

import Dict
import Html exposing (Attribute)
import Html.Events exposing (defaultOptions, on, onWithOptions, targetValue)
import Json.Decode as Json exposing (succeed)
import Set


(=>) =
    (,)


weekDayStrings : Dict.Dict Int String
weekDayStrings =
    Dict.fromList <| List.indexedMap (,) [ "Mondays", "Tuesdays", "Wednesdays", "Thursdays", "Fridays", "Saturdays", "Sundays" ]


weekDay : Int -> String
weekDay n =
    Dict.get (n - 1) weekDayStrings
        |> Maybe.withDefault ""


getLangs : List { a | language : String } -> List String
getLangs xs =
    xs
        |> List.map .language
        |> Set.fromList
        |> Set.toList


hrefClick : (String -> msg) -> String -> Attribute msg
hrefClick msg url =
    onWithOptions
        "click"
        { defaultOptions | preventDefault = True }
        (succeed (msg url))


onChange msg =
    on "change" (Json.map msg targetValue)
