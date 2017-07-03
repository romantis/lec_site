port module Ports exposing (..)

import Models exposing (Meeting)


port meetings : (List Meeting -> msg) -> Sub msg
