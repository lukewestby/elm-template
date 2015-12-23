# elm-template

Type-safe Elm string templating with records.

## Examples

Using pipelining:
```elm
import Template exposing (template, render, withValue, withString)

myTemplate =
  template "My name is "
    |> withValue .name
    |> withString ", nice to meet you!"

render myTemplate { name = "Luke" }

```

Using inline functions:
```elm
import Template exposing (template, render, andValue, andString)

myTemplate =
  template "My name is " `andValue` .name `andString` ", nice to meet you!"

render myTemplate { name = "Luke" }
```

Using infix operators:
```elm
import Template exposing (template, render)
import Template.Infix exposing ((<%), (%>))

myTemplate =
  template "My name is " <% .name %> ", nice to meet you!"

render myTemplate { name = "Luke" }
```

## Contributing

I'm happy to receive any feedback and thinking about additional features. Any
input and pull requests are very welcome and encouraged. If you'd like to help
or have ideas, get in touch with me at @luke_dot_js on Twitter or @luke in the
elmlang Slack!
