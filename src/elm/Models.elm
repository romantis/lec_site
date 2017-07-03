module Models exposing (..)

import Date exposing (Date)
import Dict exposing (Dict)
import Routing exposing (Route(..))


type alias Model =
    { route : Routing.Route
    , navItems : List Route
    , meetings : List Meeting
    , languages : List String
    , selectedLang : String
    , shownMap : PlaceID
    , content : Dict String String
    , date : Date
    }


type alias PlaceID =
    String


type alias Meeting =
    { name : String
    , day : Int
    , language : String
    , country : String
    , city : String
    , address : String
    , placeID : String
    , placeDetails : String
    , timeStart : String
    , timeEnd : String
    , organizer : String
    , fb : String
    , phone : String
    , banner : String
    , comments : String
    }


initialModel : Routing.Route -> Model
initialModel route =
    { route = route
    , navItems = [ AboutRoute, FAQRoute ]
    , meetings = []
    , languages = []
    , selectedLang = ""
    , shownMap = ""
    , content = Dict.fromList [ ( "about", "" ), ( "faq", "" ) ]
    , date = Date.fromTime 0
    }



-- Google API key


apiKey =
    "AIzaSyAZPOMF-7awWnuDascXmOkYFbT1xSXaIy4"
