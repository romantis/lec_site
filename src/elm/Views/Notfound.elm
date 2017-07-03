module Views.NotFound exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, style)




(=>) = (,)

view : Html msg
view  = 
    div 
        [ style
            [ "padding" => "2em"
            , "text-align" => "center"
            ]
        ]
        [ h1 [] [ text "Oops!" ]
        , h2 [] [ text "404 Not Found" ]
        , p [] [ text "Sorry, an error has occured, Requested page not found!" ]
        , div 
            [ style
                [ "margin" => "1em"
                ] 
            ]
            [ a 
                [ href "/"
                , style
                    ["margin-right" => "1em"]
                ]
                [ text "Take Me Home "]
            , a [ href "mailto:support@example.com" ]
                [ text "Contact Support "
                ]
            ]
        ]
