module Views.Footer exposing (view)

import Html exposing (Html, a, div, footer, img, p, span, text)
import Html.Attributes exposing (alt, class, href, id, target)
import Time exposing(Posix, toYear, utc)


view :Posix -> Html msg
view posix =
    footer [ id "footer", class "lc-footer" ]
        [ p []
            [ text "All code for this site is open. "
            , a [ href "https://github.com/romantis/lec_site", target "_blank" ] [ text "Check it out!" ]
            ]
        , p []
            [ text " © "
            , text <| String.fromInt <| toYear utc posix
            , a [ href "https://github.com/romantis/", target "_blank" ] [ text " Roman Tyshchenko" ]
            ]
        ]
