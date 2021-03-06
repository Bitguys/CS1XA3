import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Html.Events as Events
import Http
import String

rootUrl = "https://mac1xa3.ca/e/guox54/lab7"
-- MAIN


main =
  Browser.element { init = init
                  , update = update
                  , view = view
                  , subscriptions = \_ -> Sub.none
                  }


-- MODEL

type alias Model =
  { name : String
  , password : String
  , passwordAgain : String
  , post_response : String
  , error_response : String 
  }

init : () -> ( Model, Cmd Msg )
init _ =
    ( {name = ""
      , password = ""
      , passwordAgain = ""
      , post_response = "Waiting to make request"
      , error_response = ""
      }
    , Cmd.none
    )


-- UPDATE


type Msg
  = Name String
  | Password String
  | PasswordAgain String
  | PostResponse (Result Http.Error String)
  | PostButton 
  

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Name name ->
        ({ model | name = name }, Cmd.none )

    Password password ->
        ({ model | password = password }, Cmd.none )

    PasswordAgain password ->
        ({ model | passwordAgain = password }, Cmd.none )
    PostResponse result ->
        case result of
            Ok val ->
                ( { model | post_response = val, error_response = "" }, Cmd.none )

            Err error ->
                ( handleError model error, Cmd.none )

    PostButton ->
        ( model, performPost )


-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ viewInput "text" "Name" model.name Name
    , viewInput "password" "Password" model.password Password
    , viewValidation model
    ]


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
  input [ type_ t, placeholder p, value v, onInput toMsg ] []
  
performPost : Cmd Msg
performPost =
    Http.post
        { url = "https://mac1xa3.ca/e/lij416/lab7/"
        , body = Http.stringBody "application/x-www-form-urlencoded" "name=name&password=password"
        , expect = Http.expectString PostResponse
        }

handleError : Model -> Http.Error -> Model
handleError model error =
    case error of
        Http.BadUrl url ->
            { model | error_response = "bad url: " ++ url }

        Http.Timeout ->
            { model | error_response = "timeout" }

        Http.NetworkError ->
            { model | error_response = "network error" }

        Http.BadStatus i ->
            { model | error_response = "bad status " ++ String.fromInt i }

        Http.BadBody body ->
            { model | error_response = "bad body " ++ body }


viewValidation : Model -> Html msg
viewValidation model =
  if model.name == "Jimmy" && model.password == "Hendrix"then
    div [ style "color" "green" ] [ text "Cool" ]
  else
    div [ style "color" "red" ] [ text "Bad User Name" ]


