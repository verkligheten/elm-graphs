module Init exposing (..)

import Decoder exposing (..)
import Models exposing (ExchangeItem, Model, Msg)


init : ( Model, Cmd Msg )
init =
    ( initModel, getRippleExchanges )


initModel : Model
initModel =
    { result = "fail"
    , count = 0
    , marker = ""
    , exchanges = []
    }
