module Debug
  ( debugger
  , dir
  , log
  , logShow
  , taggedLog
  , taggedLogShow
  , todo
  , unsafeLog
  , unsafeDir
  ) where

import Prelude
import Unsafe.Coerce (unsafeCoerce)

-- | Adds a `debugger` statement.
foreign import debugger :: ∀ a. a -> a

-- | Calls `console.dir` with its argument, then returns it.
foreign import dir :: ∀ a. a -> a

-- | Calls `console.log` with its argument, then returns it.
foreign import log :: ∀ a. a -> a

foreign import logShowImpl :: ∀ a. (a -> String) -> a -> a

-- | For an argument `a`, calls `console.log` on `show a` and then returns `a`.
logShow :: ∀ a. Show a => a -> a
logShow = logShowImpl show

foreign import taggedLogImpl :: ∀ a. String -> a -> a

-- | For a string `t` and value `a`, calls `console.log(t, a)` and returns `a`.
taggedLog :: ∀ a. String -> a -> a
taggedLog = taggedLogImpl

foreign import taggedLogShowImpl :: ∀ a. (a -> String) -> String -> a -> a

-- | For a string `t` and value `a`, calls `console.log(t, (show a))` and returns `a`.
taggedLogShow :: ∀ a. Show a => String -> a -> a
taggedLogShow = taggedLogShowImpl show

-- | A placeholder to use when you want your code to compile without finishing something.
todo :: ∀ a. a
todo = unsafeCoerce unit

-- | Like `log` except it coerces the input to any type.
unsafeLog :: ∀ a b. a -> b
unsafeLog = unsafeCoerce <<< log

-- | Like `dir` except it coerces the input to any type.
unsafeDir :: ∀ a b. a -> b
unsafeDir = unsafeCoerce <<< dir
