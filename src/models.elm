module Models exposing (..)

import Http


type Msg
    = SetRates (Result Http.Error Model)


type alias Model =
    { result : String
    , count : Int
    , marker : String
    , exchanges : List ExchangeItem
    }


type alias ExchangeItem =
    { base_amount : String
    , counter_amount : String
    , node_index : Int
    , rate : String
    , buyer : String
    , executed_time : String
    , ledger_index : Int
    , offer_sequence : Int
    , seller : String
    , taker : String
    , tx_hash : String
    , tx_type : String
    , tx_index : Int
    , base_currency : String
    , counter_currency : String
    , counter_issuer : String
    }
