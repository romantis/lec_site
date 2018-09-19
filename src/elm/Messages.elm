module Messages exposing (..)

import Http
import Browser exposing (UrlRequest)
import Models exposing (Meeting, PlaceID)
import Time exposing (Posix)
import Url exposing (Url)


type Msg
  = NoOp
  | LocationUpd UrlRequest
  | Navigate Url
  | GotMeetings (List Meeting)
  | ShowMap PlaceID
  | FilterLang String
  | GetMD String (Result Http.Error String)
  | NowDate Posix