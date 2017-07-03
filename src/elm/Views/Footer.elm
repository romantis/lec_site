module Views.Footer exposing (view)

import Html exposing (Html, a, div, footer, img, p, text)
import Html.Attributes exposing (alt, class, href, id)


view : Int -> Html msg
view year =
    footer [ id "footer", class "lc-footer" ]
        [ text "Made by "
        , a [ href "https://github.com/romantis", class "lc-footer__link" ]
            [ text "Roman Tischenko" ]
        , text " © "
        , text <| toString year
        ]
