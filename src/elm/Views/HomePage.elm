module Views.HomePage exposing (..)

import Html exposing (..)
-- import Html.Attributes exposing (class)
-- import Html.Events exposing (onInput)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Views.Meetings as Meetings
import Views.Jumbotron as Jumbotron

       


view: Model-> Html Msg
view model  = 
    div [] 
        [ Jumbotron.view
        , Meetings.view model
        ]
    
    
         
