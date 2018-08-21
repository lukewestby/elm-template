module Template exposing (Template, render, template, withString, withValue)

{-| Type-safe string templating


# types

@docs Template


# construction

@docs template, withValue, withString


# rendering

@docs render

-}

-- where


type Component a
    = Literal String
    | Interpolation (a -> String)


{-| A list of the components of a template
-}
type alias Template a =
    List (Component a)


{-| Create an initial template starting with the given string

    template "my string "

-}
template : String -> Template record
template initial =
    [ Literal initial ]


{-| Attach a record accessor to a template

    template "my string "
        |> withValue .hello

-}
withValue : (record -> String) -> Template record -> Template record
withValue interpolator currentTemplate =
    Interpolation interpolator :: currentTemplate


{-| Attach a string to a template

    template "my string "
        |> withValue .hello
        |> withString " another string"

-}
withString : String -> Template record -> Template record
withString string currentTemplate =
    Literal string :: currentTemplate


renderComponent : record -> Component record -> String -> String
renderComponent record component result =
    case component of
        Literal string ->
            (++) result string

        Interpolation accessor ->
            (++) result (accessor record)


{-| Walks through a template's components and renders them to a single string

    template "my string "
        |> withValue .hello
        |> withString " another string"
        |> render { hello = "world" }

-}
render : record -> Template record -> String
render record currentTemplate =
    List.foldr (renderComponent record) "" currentTemplate
