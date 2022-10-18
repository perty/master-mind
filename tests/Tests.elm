module Tests exposing (..)

import Expect
import Main exposing (Combination, Peg(..), hints, makeCombination)
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "Giving hints when correct is red-blue-yellow-white"
        [ let
            correct : Combination
            correct =
                makeCombination Red Blue Yellow White
          in
          test "Given a guess of green-black-black-black, then no hints" <|
            \_ -> Expect.equal [] (hints correct (makeCombination Green Black Black Black))
        ]
