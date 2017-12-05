module Views exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Models exposing (..)


view : Model -> Html msg
view model =
    let
        viewExchangeItems items =
            ul [] (List.map viewExchangeItem items)

        viewExchangeItem item =
            li [] [ Html.text item.base_amount ]
    in
    div [] [ viewExchangeItems model.exchanges ]
