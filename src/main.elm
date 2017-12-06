module Main exposing (..)

-- import String
-- import Init exposing (init)

import Html exposing (..)
import Models exposing (..)
import Updates exposing (update)
import Views exposing (view)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
