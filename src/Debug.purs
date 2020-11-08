module Debug
  ( todo
  , log
  , logShow
  , taggedLog
  , taggedLogShow
  , dir
  , debugger
  , unsafeLog
  , unsafeDir
  , unsafeTodo
  ) where

import Prelude
import Unsafe.Coerce (unsafeCoerce)

-- | Inserts a [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/debugger) `debugger` statement, then returns its argument.
foreign import debugger :: ∀ a. a -> a

-- | Calls `console.dir` with its argument, then returns it.
foreign import dir :: ∀ a. a -> a

-- | Calls `console.log` with its argument, then returns it.
-- | ```
-- |
-- | -- log a value as it's used
-- | func a = todo $ log a
-- |
-- | -- explicitly log an argument because it may not be used
-- | func a =
-- |   let
-- |     _ = log a
-- |   in
-- |     todo
-- |
-- | -- log the value inside a functor
-- | func ma = do
-- |   a <- log <$> pure ma
-- |   todo
-- | ```
foreign import log :: ∀ a. a -> a

foreign import logShowImpl :: ∀ a. (a -> String) -> a -> a

-- | For an argument `a`, calls `console.log` on `show a`, then returns `a`.
logShow :: ∀ a. Show a => a -> a
logShow = logShowImpl show

foreign import taggedLogImpl :: ∀ a. String -> a -> a

-- | For a string `t` and value `a`, calls `console.log(t, a)`, then returns `a`.
taggedLog :: ∀ a. String -> a -> a
taggedLog = taggedLogImpl

foreign import taggedLogShowImpl :: ∀ a. (a -> String) -> String -> a -> a

-- | For a string `t` and value `a`, calls `console.log(t, (show a))`, then returns `a`.
taggedLogShow :: ∀ a. Show a => String -> a -> a
taggedLogShow = taggedLogShowImpl show

foreign import todoImpl :: ∀ a b. a -> b

-- | A placeholder to use when you want your code to compile without finishing something. You will immediately get an error when trying to run any code with a `todo`, so you won't forget about it and run into errors later.
todo :: ∀ a. a
todo = todoImpl unit

-- | Like `log` except it coerces the input to any type.
unsafeLog :: ∀ a b. a -> b
unsafeLog = unsafeCoerce <<< log

-- | Like `dir` except it coerces the input to any type.
unsafeDir :: ∀ a b. a -> b
unsafeDir = unsafeCoerce <<< dir

-- | Like `todo` but it doesn't throw an error.
unsafeTodo :: ∀ a. a
unsafeTodo = unsafeCoerce unit
