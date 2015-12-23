module Template.Infix (..) where

{-| Infix operators for more concise template construction

@docs (<%), (%>)
-}

import Template exposing (Template, andValue, andString)


{-| Operator alias for andValue

    template "my string " <% .hello
-}
(<%) : Template record -> (record -> String) -> Template record
(<%) =
    andValue


{-| Operator alias for andString

    template "my string " <% .hello %> " another string"
-}
(%>) : Template record -> String -> Template record
(%>) =
    andString
