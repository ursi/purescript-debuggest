module Debug
  ( debugger
  , log
  , logShow
  , taggedLogShow
  , taggedLog
  , taggedTodo
  , todo
  ) where

import Prelude
import Unsafe.Coerce (unsafeCoerce)

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

foreign import debugger :: ∀ a. a -> a

todo :: ∀ a. a
todo = unsafeCoerce unit

taggedTodo :: ∀ a. String -> a
taggedTodo = unsafeCoerce
