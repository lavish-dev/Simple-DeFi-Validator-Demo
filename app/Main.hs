{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Main where

import Prelude (IO, putStrLn)
import PlutusTx (compile)
import PlutusTx.Prelude (BuiltinData, ())

-- | A simple validator that always succeeds
{-# INLINABLE mkSimpleValidator #-}
mkSimpleValidator :: BuiltinData -> BuiltinData -> BuiltinData -> ()
mkSimpleValidator _ _ _ = ()

-- | Compile the validator to Plutus Core
validatorCompiled = $$(compile [|| mkSimpleValidator ||])

-- | Main entry point
main :: IO ()
main = putStrLn "Simple validator compiled successfully."
