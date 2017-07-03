module Views.MDPage exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Markdown


view : String -> Html msg
view content =
    Markdown.toHtml [class "container lc-md-page"] content
    