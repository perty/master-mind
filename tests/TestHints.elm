module TestHints exposing (..)

import Expect
import Main exposing (Combination, Hint(..), Peg(..), hints, makeCombination)
import Test exposing (Test, describe, skip, test)


suite : Test
suite =
    let
        correct : Combination
        correct =
            makeCombination Red Blue Yellow White
    in
    describe "Giving hints when correct is red-blue-yellow-white"
        [ test "Given a guess of green-black-black-black, then no hints" <|
            \_ ->
                Expect.equal []
                    (hints correct (makeCombination Green Black Black Black))
        , skip <|
            test "Given a guess of red blue yellow white, then hints are all correct" <|
                \_ ->
                    Expect.equal (List.repeat 4 ColorAndPlace)
                        (hints correct (makeCombination Red Blue Yellow White))
        , skip <|
            test "Given a correct but all scrambled guess, then hints are all correct but wrong place" <|
                \_ ->
                    Expect.equal (List.repeat 4 ColorOnly)
                        (hints correct (makeCombination Blue Red White Yellow))
        , skip <|
            test "Given a single correct guess, then hints are one correct." <|
                \_ ->
                    Expect.equal [ ColorAndPlace ]
                        (hints correct (makeCombination Red Black Black Black))
        , skip <|
            test "Given one correct and one wrong place, then hints are one correct." <|
                \_ ->
                    Expect.equal [ ColorAndPlace, ColorOnly ]
                        (hints correct (makeCombination Red Black White Black))
        , skip <|
            test "Given two correct and one wrong place, then hints are two correct and one color only." <|
                \_ ->
                    Expect.equal [ ColorAndPlace, ColorAndPlace, ColorOnly ]
                        (hints correct (makeCombination Yellow Blue Black White))
        ]
