-- | A 'Read' instance for functions, given the input is 'Finite' and
-- 'Ord' and both the input and output are 'Read'.
module Data.Universe.Instances.Read () where

import Data.Map (fromList, (!))
import Data.Universe.Class (Finite (..))

-- actually, the "Finite a" part of the context wouldn't be inferred if you
-- asked GHC -- but it's kind of hopeless otherwise!
instance (Finite a, Ord a, Read a, Read b) => Read (a -> b) where
  readsPrec n s = [((fromList v !), s') | (v, s') <- readsPrec n s]
