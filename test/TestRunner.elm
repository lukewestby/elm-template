module Main exposing (..)

-- where

import ElmTest exposing (runSuite)
import Tests


main : Program Never
main =
  runSuite Tests.all
