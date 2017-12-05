module Decoder exposing (..)

import Http
import Json.Decode exposing (field)
import Json.Decode.Pipeline as Pipeline
import Models exposing (..)


getRippleExchanges : Cmd Msg
getRippleExchanges =
    let
        url =
            "https://data.ripple.com/v2/exchanges/XRP/USD+rvYAfWj5gh67oV6fW32ZzP3Aw4Eubs59B"
    in
    Http.send SetRates (Http.get url decodeExchangeData)


decodeExchangeData : Json.Decode.Decoder Model
decodeExchangeData =
    Pipeline.decode Model
        |> Pipeline.required "result" Json.Decode.string
        |> Pipeline.required "count" Json.Decode.int
        |> Pipeline.required "marker" Json.Decode.string
        |> Pipeline.required "exchanges" (Json.Decode.list decodeExchangeItem)


decodeExchangeItem : Json.Decode.Decoder ExchangeItem
decodeExchangeItem =
    Pipeline.decode ExchangeItem
        |> Pipeline.required "base_amount" Json.Decode.string
        |> Pipeline.required "counter_amount" Json.Decode.string
        |> Pipeline.required "node_index" Json.Decode.int
        |> Pipeline.required "rate" Json.Decode.string
        |> Pipeline.required "buyer" Json.Decode.string
        |> Pipeline.required "executed_time" Json.Decode.string
        |> Pipeline.required "ledger_index" Json.Decode.int
        |> Pipeline.required "offer_sequence" Json.Decode.int
        |> Pipeline.required "seller" Json.Decode.string
        |> Pipeline.required "taker" Json.Decode.string
        |> Pipeline.required "tx_hash" Json.Decode.string
        |> Pipeline.required "tx_type" Json.Decode.string
        |> Pipeline.required "tx_index" Json.Decode.int
        |> Pipeline.required "base_currency" Json.Decode.string
        |> Pipeline.required "counter_currency" Json.Decode.string
        |> Pipeline.required "counter_issuer" Json.Decode.string
