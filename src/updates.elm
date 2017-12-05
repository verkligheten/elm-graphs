module Updates exposing (update)

import Models exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetRates (Ok res) ->
            { model | exchanges = res.exchanges } ! []

        SetRates (Err err) ->
            { model | result = toString err } ! []
