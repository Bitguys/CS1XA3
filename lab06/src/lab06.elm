module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main =
      Browser.sandbox {init = init, update = update, view = view}

type alias Model = { tmp1: String, tmp2 : String }

init : Model
init =  
      Model "" ""

type Msg = Tmp1 String | Tmp2 String

update : Msg -> Model -> Model
update msg model =
        case msg of
                Tmp1 tmp1 ->
                        { model | tmp1 = tmp1 }
                Tmp2 tmp2 ->
                        { model | tmp2 = tmp2 }
view : Model -> Html Msg
view model =
         div [] 
            [ viewInput "String1" model.tmp1 Tmp1
            , viewInput "String2" model.tmp2 Tmp2
            , div [] [ text (model.tmp1)
            , text":"
            , text (model.tmp2)]
            ]

viewInput : String -> String -> (String -> msg) -> Html msg
viewInput p v tomsg =
         input [ placeholder p, value v, onInput tomsg ] [] 
