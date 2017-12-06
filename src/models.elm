module Models exposing (..)

import Http
import Json.Decode exposing (field)
import Json.Decode.Pipeline as Pipeline


type Msg
    = SetRates (Result Http.Error Model)


type alias Model =
    { result : String
    , count : Int
    , exchanges : List ExchangeItem
    }


type alias ExchangeItem =
    { base_volume : String
    , buy_volume : Float
    , close : String
    , close_time : String
    , count : Int
    , counter_volume : String
    , high : String
    , low : String
    , open : String
    , open_time : String
    , start : String
    , vwap : String
    , base_currency : String
    , counter_currency : String
    , counter_issuer : String
    }


init : ( Model, Cmd Msg )
init =
    ( initModel, getRippleExchanges )


initModel : Model
initModel =
    { result = "fail"
    , count = 0
    , exchanges = []
    }


getRippleExchanges : Cmd Msg
getRippleExchanges =
    let
        url =
            "https://data.ripple.com/v2/exchanges/XRP/USD+rvYAfWj5gh67oV6fW32ZzP3Aw4Eubs59B?limit=1000&interval=30minute&start=2017-12-04T15:30:00&end=2017-12-05T15:30:00"
    in
    Http.send SetRates (Http.get url decodeExchangeData)


decodeExchangeData : Json.Decode.Decoder Model
decodeExchangeData =
    Pipeline.decode Model
        |> Pipeline.required "result" Json.Decode.string
        |> Pipeline.required "count" Json.Decode.int
        |> Pipeline.required "exchanges" (Json.Decode.list decodeExchangeItem)


decodeExchangeItem : Json.Decode.Decoder ExchangeItem
decodeExchangeItem =
    Pipeline.decode ExchangeItem
        |> Pipeline.required "base_volume" Json.Decode.string
        |> Pipeline.required "buy_volume" Json.Decode.float
        |> Pipeline.required "close" Json.Decode.string
        |> Pipeline.required "close_time" Json.Decode.string
        |> Pipeline.required "count" Json.Decode.int
        |> Pipeline.required "counter_volume" Json.Decode.string
        |> Pipeline.required "high" Json.Decode.string
        |> Pipeline.required "low" Json.Decode.string
        |> Pipeline.required "open" Json.Decode.string
        |> Pipeline.required "open_time" Json.Decode.string
        |> Pipeline.required "start" Json.Decode.string
        |> Pipeline.required "vwap" Json.Decode.string
        |> Pipeline.required "base_currency" Json.Decode.string
        |> Pipeline.required "counter_currency" Json.Decode.string
        |> Pipeline.required "counter_issuer" Json.Decode.string
