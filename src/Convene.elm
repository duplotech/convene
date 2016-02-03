module Convene where

import StartApp exposing (start)
import Task exposing (Task)
import Signal exposing (Signal, Address)
import Effects exposing (Effects, Never)

import Html exposing (Html, Attribute, text, div)
import Html.Attributes exposing (style)

type alias Model = String
type Action = NoOp

main : Signal Html
main = app.html

app : StartApp.App Model
app = StartApp.start
  { init = init
  , view = view
  , update = update
  , inputs = []
  }

initialModel : String
initialModel = "Hello There"

init : (Model, Effects Action)
init = (initialModel, Effects.none)

(=>) : a -> b -> (a, b)
(=>) = (,)

backgroundStyle : Attribute
backgroundStyle =
  style
    [ "color" => "green"
    , "background-color" => "black"
    ]

view : Address Action -> Model -> Html
view address model =
  div [ backgroundStyle ] [ text model ]

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    NoOp -> (model, Effects.none)

port tasks : Signal (Task Never ())
port tasks = app.tasks
