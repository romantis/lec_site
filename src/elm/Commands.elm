module Commands exposing(..)

import Http
-- import Json.Decode as Json
import Messages exposing(Msg(..))


getPageMD : String -> Cmd Msg
getPageMD name =
    Http.getString ("content/" ++ name ++ ".md")
        |> Http.send (GetMD name) 