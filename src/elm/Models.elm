module Models exposing (..)

import Time exposing(Posix, millisToPosix)
import Dict exposing (Dict)
import Routing exposing (Route(..))
import Browser.Navigation exposing (Key)


type alias Model =
    { route : Routing.Route
    , key : Key
    , navItems : List Route
    , meetings : List Meeting
    , languages : List String
    , selectedLang : String
    , shownMap : PlaceID
    , content : Dict String String
    , date : Posix
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
    , slug : String
    }


initialModel : Routing.Route -> Key -> Model
initialModel route key =
    { route = route
    , key = key
    , navItems = [ AboutRoute, FAQRoute ]
    , meetings = []
    , languages = []
    , selectedLang = ""
    , shownMap = ""
    , content = Dict.fromList [ ( "about", "" ), ( "faq", "" ) ]
    , date = millisToPosix 0
    }



-- Google API key


apiKey =
    "AIzaSyAZPOMF-7awWnuDascXmOkYFbT1xSXaIy4"
