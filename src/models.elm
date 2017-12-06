module Models exposing (..)

import Http


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
