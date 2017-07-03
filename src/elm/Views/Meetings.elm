module Views.Meetings exposing (..)

import Helpers.Main exposing ((=>), onChange, weekDay)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on, onClick)
import Json.Decode as Json
import List
import Messages exposing (Msg(..))
import Models exposing (Meeting, Model, PlaceID, apiKey)
import Views.Icons exposing (fbIcon, flagIcon, phoneIcon)
import Views.Spinner as Spinner


view : Model -> Html Msg
view model =
    let
        filterLang lang meeting =
            if meeting.language == lang then
                Just meeting
            else
                Nothing

        filteredMeetings : List Meeting
        filteredMeetings =
            if String.isEmpty model.selectedLang then
                model.meetings
            else
                List.filterMap (filterLang model.selectedLang) model.meetings
    in
    section [ id "lc-meetings", class "lc-meetings container" ]
        [ h2 [ class "lc-meeting__title" ]
            [ text "Weekly meetings" ]
        , selectLangView model.languages model.selectedLang
        , mgListView filteredMeetings model.shownMap
        ]


selectLangView : List String -> String -> Html Msg
selectLangView langs selectedLang =
    div []
        [ text "Show Language"
        , select [ onChange FilterLang ] <|
            option [ value "" ] [ text "All" ]
                :: List.map (langOption selectedLang) langs
        ]


langOption : String -> String -> Html Msg
langOption selectedLang lang =
    option [ value lang, selected (selectedLang == lang) ]
        [ text lang ]


mgListView : List Meeting -> PlaceID -> Html Msg
mgListView meetings shownMap =
    div [ class "lc-meetings__list" ] <|
        if meetings == [] then
            [ Spinner.view ]
        else
            List.map (mgView shownMap) meetings


mgView : PlaceID -> Meeting -> Html Msg
mgView shownMap mg =
    let
        --  ID for loading Google map
        meetingID =
            String.toLower <|
                weekDay mg.day
                    ++ String.slice -5 -1 mg.fb

        ifPlaceID node =
            if String.isEmpty mg.address then
                text ""
            else
                node
    in
    section [ class "lc-meeting" ]
        [ mgHeaderView mg.day mg.timeStart mg.timeEnd mg.language
        , mgBannerView mg.banner
        , h3 [ class "lc-meeting_title" ]
            [ text mg.name ]
        , mgPlaceView mg.city mg.country mg.address mg.placeDetails
        , p [ class "lc-meeting__comment" ]
            [ em []
                [ text mg.comments ]
            ]
        , ifPlaceID <|
            div [ style [ "textAlign" => "right" ] ]
                [ a [ href "javascript: void(0)", onClick <| ShowMap meetingID ]
                    [ if meetingID == shownMap then
                        text "Hide Map"
                      else
                        text "Show Map"
                    ]
                ]
        , ifPlaceID <|
            mgMapView mg.placeID (meetingID == shownMap)
        , mgFooterView mg.organizer mg.fb mg.phone
        ]


mgHeaderView : Int -> String -> String -> String -> Html Msg
mgHeaderView day timeStart timeEnd lang =
    header [ class "lc-meeting__meta lc-meeting__meta--bb" ]
        [ span []
            [ text <| weekDay day ++ " at " ++ timeStart ++ " - " ++ timeEnd ]
        , span []
            [ flagIcon lang [ class "lc-meeting-icon" ]
            ]
        ]


mgBannerView : String -> Html Msg
mgBannerView banner =
    if String.isEmpty banner then
        text ""
    else
        div [ style [ "backgroundImage" => ("url(images/thumbnails/" ++ banner ++ ")") ], class "lc-meeting__banner" ] []


mgPlaceView : String -> String -> String -> String -> Html Msg
mgPlaceView city country address placeDetails =
    p [ class "lc-meeting-place" ]
        [ strong [] [ text <| city ++ ", " ++ country ++ ", " ]

        --  I'm not sure if we need to show address
        -- , text (if address == ""  then "" else address ++ ", ")
        , text placeDetails
        ]


mgMapView : PlaceID -> Bool -> Html Msg
mgMapView pid isShown =
    if not isShown then
        text ""
    else
        iframe
            [ class "lc-meeting__map"
            , attribute "allowfullscreen" ""
            , attribute "frameborder" "0"
            , src <| "https://www.google.com/maps/embed/v1/place?q=place_id:" ++ pid ++ "&key=" ++ apiKey
            ]
            []


mgFooterView : String -> String -> String -> Html Msg
mgFooterView organizer fb phone =
    footer [ class "lc-meeting-contacts" ]
        [ h4 [ class "lc-meeting-contacts__title" ]
            [ text "Contacts" ]
        , div [ class "lc-meeting-contacts__body" ]
            [ a [ href fb, target "_blank" ]
                [ fbIcon "22" "#3B5998"
                , span [ style [ "margin-left" => "5px" ] ]
                    [ text organizer ]
                ]
            , if phone /= "" then
                a [ href <| "tel: +" ++ phone ]
                    [ phoneIcon [ class "lc-meeting__icon" ]
                    , text <| "+" ++ phone
                    ]
              else
                text ""
            ]
        ]
