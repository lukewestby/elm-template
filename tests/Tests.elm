module Tests exposing (..)

-- where

import Expect
import Template exposing (Template, render, template, withString, withValue)
import Test exposing (..)


all : Test
all =
    describe
        "A Test Suite"
        [ test "Single string template" <|
            \_ ->
                template "hello"
                    |> render {}
                    |> Expect.equal "hello"
        , test "Template with accessor" <|
            \_ ->
                template "hello "
                    |> withValue (.hello >> String.fromInt)
                    |> render { hello = 1 }
                    |> Expect.equal "hello 1"
        , test "Template with accessor and string" <|
            \_ ->
                template "hello "
                    |> withValue (.hello >> String.fromInt)
                    |> withString " another"
                    |> render { hello = 1 }
                    |> Expect.equal "hello 1 another"
        ]
