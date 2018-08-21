# elm-template

Type-safe Elm string templating with records.

## Examples

```elm
import Template exposing (template, render, withValue, withString)

myTemplate =
  template "My name is "
    |> withValue .name
    |> withString ", nice to meet you!"

render { name = "Luke" } myTemplate

```

## Contributing

I'm happy to receive any feedback and thinking about additional features. Any
input and pull requests are very welcome and encouraged. If you'd like to help
or have ideas, get in touch with me at @luke in the elmlang Slack!

---

Thanks to [Richard Feldman](https://github.com/rtfeldman) for guidance on the
API!
