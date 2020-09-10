module Debug
  ( debugger
  , dir
  , log
  , logShow
  , taggedLogShow
  , taggedLog
  , todo
  , unsafeLog
  , unsafeDir
  ) where

import Prelude
import Unsafe.Coerce (unsafeCoerce)

foreign import debugger :: ∀ a. a -> a

foreign import dir :: ∀ a. a -> a

foreign import log :: ∀ a. a -> a

foreign import logShowImpl :: ∀ a. (a -> String) -> a -> a

logShow :: ∀ a. Show a => a -> a
logShow = logShowImpl show

foreign import taggedLogImpl :: ∀ a. String -> a -> a

taggedLog :: ∀ a. String -> a -> a
taggedLog = taggedLogImpl

foreign import taggedLogShowImpl :: ∀ a. (a -> String) -> String -> a -> a

taggedLogShow :: ∀ a. Show a => String -> a -> a
taggedLogShow = taggedLogShowImpl show

todo :: ∀ a. a
todo = unsafeCoerce unit

unsafeLog :: ∀ a b. a -> b
unsafeLog = unsafeCoerce <<< log

unsafeDir :: ∀ a b. a -> b
unsafeDir = unsafeCoerce <<< dir
