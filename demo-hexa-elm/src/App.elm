module App exposing (..)

import Html exposing (Html, text, div, img, h1, input, button, br)
import Html.Attributes exposing (placeholder, value, style)
import Html.Events exposing (onClick, onInput)
import String exposing (toFloat)
import Discount exposing (..)


---- MODEL ----


type alias Model =
    { input : String, discount : Maybe Float }


model : Model
model =
    { input = "", discount = Nothing }



---- UPDATE ----


discountHalf : DiscountRate
discountHalf =
    \_ -> 0.5


calculateDiscount : Float -> Float
calculateDiscount =
    discount0



-- calculateDiscount : Float -> Float
-- calculateDiscount =
--     discount discountHalf


type Msg
    = CalculateDiscount String


update : Msg -> Model -> Model
update msg model =
    case msg of
        CalculateDiscount value ->
            let
                amount =
                    String.toFloat value |> Result.toMaybe
            in
                { input = value, discount = Maybe.map calculateDiscount amount }



---- VIEW ----


rightAligned =
    style
        [ ( "text-align", "right" ) ]


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Demo Haxagonal Architecture" ]
        , div []
            [ text "Amount"
            , input
                [ placeholder "Amount"
                , rightAligned
                , value model.input
                , onInput CalculateDiscount
                ]
                []
            , br [] []
            , text (Maybe.withDefault "" <| Maybe.map (\discount -> "Discount is " ++ toString discount) model.discount)
            ]
        ]



---- PROGRAM ----


main =
    Html.beginnerProgram
        { view = view
        , model = model
        , update = update
        }
