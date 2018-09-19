module Views.Header exposing (view)

import Helpers.Main exposing (hrefClick)
import Html exposing (..)
import Html.Attributes exposing (class, classList, href, src, style, target, title)
import Messages exposing (Msg(..))
import Routing exposing (Route)
import Views.Icons exposing (fbIcon)


view : Route -> List Route -> Html Msg
view currentPage pages =
    nav [ class "lc-nav" ] <|
        [ a
            [ class "lc-nav__item lc-nav__item--brand"
            , href "/meetings"
            ]
            [ abbr [ title "Language Exchange Club" ]
                [ text "LEC" ]
            ]
        , span [ class "lc-nav__devider" ] []
        ]
            ++ List.map (navItemView currentPage) pages
            ++ [ a [ href "https://www.facebook.com/groups/82542151162/", target "_blank", class "lc-nav__item lc-nav_icon" ]
                    [ fbIcon "30" "#fff" ]
               ]


navItemView : Route -> Route -> Html Msg
navItemView current route =
    let
        isActive =
            current == route

        routeName =
            Routing.routeString route
    in
    a
        [ classList
            [ ("lc-nav__item", True)
            , ("lc-nav__item--active", isActive)
            ]
        , href <| routeName
        ]
        [ text routeName
        ]
