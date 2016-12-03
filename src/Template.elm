module Template exposing (Template, template, withValue, withString, render)

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
withValue interpolator template =
  Interpolation interpolator :: template


{-| Attach a string to a template

    template "my string "
        |> withValue .hello
        |> withString " another string"
-}
withString : String -> Template record -> Template record
withString string template =
  (Literal string) :: template


renderComponent : record -> Component record -> String -> String
renderComponent record component result =
  case component of
    Literal string ->
      (++) result string

    Interpolation accessor ->
      (++) result (accessor record)


{-| Walks through a template's components and renders them to a single string

    render
      (template "my string " `andValue` .hello)
      ({ hello = "world" })
-}
render : Template record -> record -> String
render template record =
  List.foldr (renderComponent record) "" template
