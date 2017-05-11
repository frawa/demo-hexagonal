module Tests exposing (..)

import Test exposing (..)
import Expect
import Discount exposing (..)
import Dict


discountTenth : DiscountRate
discountTenth _ =
    0.1


steps : Dict.Dict Float Float
steps =
    Dict.fromList [ ( 0, 0 ), ( 10.0, 0.1 ), ( 100.0, 0.5 ), ( 1 / 0, 0.5 ) ]


discountSteps : Dict.Dict Float Float -> Float -> Float
discountSteps steps amount =
    steps
        |> Dict.filter (\step _ -> amount <= step)
        |> Dict.values
        |> List.head
        |> Maybe.withDefault 0


all : Test
all =
    describe "Discount"
        [ describe "Simple"
            [ test "simple rate" <|
                \() ->
                    Expect.equal (discount0 130) 13
            ]
        , describe "With rate"
            [ test "constant rate" <|
                \() ->
                    Expect.equal (discount discountTenth 130) 13
            ]
        , describe "Step function"
            [ test "before stops" <|
                \() ->
                    Expect.equal (discountSteps steps -1) 0
            , test "step 1" <|
                \() ->
                    Expect.equal (discountSteps steps 5) 0.1
            , test "step 2" <|
                \() ->
                    Expect.equal (discountSteps steps 100) 0.5
            , test "after steps" <|
                \() ->
                    Expect.equal (discountSteps steps 1000) 0.5
            ]
        ]
