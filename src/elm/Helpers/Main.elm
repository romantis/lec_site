module Helpers.Main exposing (..)

import Dict
import Html exposing (Attribute)
import Html.Events exposing (on, targetValue, preventDefaultOn)
import Json.Decode as Json exposing (succeed)
import Time exposing (utc, toHour, toMinute)
import Set
import Tuple


weekDays =
    [ "Mondays"
    , "Tuesdays"
    , "Wednesdays"
    , "Thursdays"
    , "Fridays"
    , "Saturdays"
    , "Sundays" 
    ]

weekDayStrings : Dict.Dict Int String
weekDayStrings =
    weekDays
        |> List.indexedMap Tuple.pair
        |> Dict.fromList


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


hrefClick : msg-> Attribute msg
hrefClick msg =
     preventDefaultOn
        "click" 
        (Json.map alwaysPreventDefault (Json.succeed msg))


alwaysPreventDefault : msg -> ( msg, Bool )
alwaysPreventDefault msg =
  ( msg, True )

onChange msg =
    on "change" (Json.map msg targetValue)


toUtcString : Time.Posix -> String
toUtcString time =
    String.fromInt (toHour utc time)
    ++ ":" ++
    String.fromInt (toMinute utc time)
    ++ " (UTC)"