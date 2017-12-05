module Main exposing (..)

-- import String

import Html exposing (..)
import Init exposing (init)
import Models exposing (ExchangeItem, Model, Msg)
import Updates exposing (update)
import Views exposing (view)


-- MAIN --


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
