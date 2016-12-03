module Template.Infix exposing (..)

{-| Infix operators for more concise template construction

@docs (<%), (%>)
-}


import Template exposing (Template, withValue, withString)


{-| Operator alias for andValue

    template "my string " <% .hello
-}
(<%) : Template record -> (record -> String) -> Template record
(<%) =
  flip withValue


{-| Operator alias for andString

    template "my string " <% .hello %> " another string"
-}
(%>) : Template record -> String -> Template record
(%>) =
  flip withString
