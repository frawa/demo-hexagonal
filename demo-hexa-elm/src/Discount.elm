module Discount exposing (..)


discount0 : Float -> Float
discount0 amount =
    amount * 0.1


type alias DiscountRate =
    Float -> Float


discount : DiscountRate -> Float -> Float
discount discountRate amount =
    amount * discountRate amount
