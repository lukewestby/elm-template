module Tests (..) where

import ElmTest exposing (..)
import Template exposing (Template, withValue, withString, template, render)


singleStringTemplate : Template {}
singleStringTemplate =
    template "hello"


accessorTemplate : Template { hello : Int }
accessorTemplate =
    template "hello "
        |> withValue (.hello >> toString)


accessorAndStringTemplate : Template { hello : Int }
accessorAndStringTemplate =
    template "hello "
        |> withValue (.hello >> toString)
        |> withString " another"


all : Test
all =
    suite
        "A Test Suite"
        [ test "Single string template"
            <| assertEqual (render singleStringTemplate {}) "hello"
        , test "Template with accessor"
            <| assertEqual (render accessorTemplate { hello = 1 }) "hello 1"
        , test "Template with accessor and string"
            <| assertEqual (render accessorAndStringTemplate { hello = 1 }) "hello 1 another"
        ]
