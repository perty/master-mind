module Main exposing (main, makeCombination, Combination, Peg(..), hints)

import Array exposing (Array)
import Browser
import Html exposing (div, text)


type alias Model =
    { correct : Combination
    , guesses : List Combination
    }


type Msg
    = NoOp


type alias Combination =
    Array Peg


type Peg
    = Red
    | Green
    | Yellow
    | Blue
    | Black
    | White


type Hint
    = ColorAndPlace
    | ColorOnly


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


init : Model
init =
    { correct = makeCombination Red Green Yellow Blue
    , guesses = []
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model


view : Model -> Html.Html Msg
view model =
    div []
        [ text "Hello"
        ]



-- Gurantee it is always 4 pegs


makeCombination : Peg -> Peg -> Peg -> Peg -> Combination
makeCombination peg1 peg2 peg3 peg4 =
    Array.fromList [ peg1, peg2, peg3, peg4 ]

hints: Combination -> Combination -> List Hint
hints correct guess =
    []