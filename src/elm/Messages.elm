module Messages exposing (..)

import Navigation exposing (Location)
import Http
import Models exposing(Meeting, PlaceID)
import Date exposing (Date)


type Msg
  = LocationUpd Location
  | Navigate String
  | GotMeetings (List Meeting)
  | ShowMap PlaceID
  | FilterLang String
  | GetMD String (Result Http.Error String)
  | NowDate Date