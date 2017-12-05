module Main exposing (..)

import Html exposing (..)
import Init exposing (init)
import Models exposing (ExchangeItem, Model, Msg)
import String
import Updates exposing (update)
import Views exposing (view)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
