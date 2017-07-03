module Views.Jumbotron exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)

view =
    div [ class "lc-jumbotron" ]
        [ p [ class "lc-jumbotron__title" ]
            [ text "Language Exchange Club" ]
        , p [ class "lc-jumbotron__description" ]
            [ em []
                [ text "free" ]
            , text " "
            , strong []
                [ text "Speaking Club" ]
            ]
        ]