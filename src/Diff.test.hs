module Main
where

import Test.Framework
import Test.Framework.Providers.HUnit
import Test.HUnit
import Diff

main = defaultMain tests

tests = hUnitTestToTests $ TestList $
  diffExamples

diffExamples =
  [
    diff "123" "1" ~?= "1__"
    , diff "hello" "halli" ~?= "h_ll_"
    , diff "Hello" "halli" ~?= "__ll_"
  ]
