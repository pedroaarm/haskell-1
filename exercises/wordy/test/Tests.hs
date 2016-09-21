{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# LANGUAGE RecordWildCards #-}

import Data.Foldable     (for_)
import Test.Hspec        (Spec, describe, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

import WordProblem (answer)

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

specs :: Spec
specs = describe "wordy" $
          describe "answer" $ for_ cases test
  where

    test Case{..} = it description assertion
      where
        assertion   = answer input `shouldBe` fromIntegral <$> expected

-- Test cases adapted from `exercism/x-common/wordy.json` on 2016-08-10.

data Case = Case { description :: String
                 , input       :: String
                 , expected    :: Maybe Integer
                 }

cases :: [Case]
cases = [ Case { description = "addition"
               , input       = "What is 1 plus 1?"
               , expected    = Just 2
               }
        , Case { description = "more addition"
               , input       = "What is 53 plus 2?"
               , expected    = Just 55
               }
        , Case { description = "addition with negative numbers"
               , input       = "What is -1 plus -10?"
               , expected    = Just (-11)
               }
        , Case { description = "large addition"
               , input       = "What is 123 plus 45678?"
               , expected    = Just 45801
               }
        , Case { description = "subtraction"
               , input       = "What is 4 minus -12?"
               , expected    = Just 16
               }
        , Case { description = "multiplication"
               , input       = "What is -3 multiplied by 25?"
               , expected    = Just (-75)
               }
        , Case { description = "division"
               , input       = "What is 33 divided by -3?"
               , expected    = Just (-11)
               }
        , Case { description = "multiple additions"
               , input       = "What is 1 plus 1 plus 1?"
               , expected    = Just 3
               }
        , Case { description = "addition and subtraction"
               , input       = "What is 1 plus 5 minus -2?"
               , expected    = Just 8
               }
        , Case { description = "multiple subtraction"
               , input       = "What is 20 minus 4 minus 13?"
               , expected    = Just 3
               }
        , Case { description = "subtraction then addition"
               , input       = "What is 17 minus 6 plus 3?"
               , expected    = Just 14
               }
        , Case { description = "multiple multiplication"
               , input       = "What is 2 multiplied by -2 multiplied by 3?"
               , expected    = Just (-12)
               }
        , Case { description = "addition and multiplication"
               , input       = "What is -3 plus 7 multiplied by -2?"
               , expected    = Just (-8)
               }
        , Case { description = "multiple division"
               , input       = "What is -12 divided by 2 divided by -3?"
               , expected    = Just 2
               }
        , Case { description = "unknown operation"
               , input       = "What is 52 cubed?"
               , expected    = Nothing
               }
        , Case { description = "Non math question"
               , input       = "Who is the President of the United States?"
               , expected    = Nothing
               }
        ]
