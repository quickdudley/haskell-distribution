{- Copyright 2014 Romain Edelmann

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License. -}


-- | This modules provides distributions from dice and
--   functions on dice.
module Data.Distribution.Domain.Dice
    ( -- * Dice
      Dice
    , dice
      -- ** Common dice
    , d4
    , d6
    , d8
    , d10
    , d20
      -- ** Operations
    , rollsOf
    , rerollOn
    ) where

import Data.Distribution.Core

-- | Distribution of the result of dice rolls.
type Dice = Distribution Int

-- | Fair dice of @n@ faces.
dice :: Int -> Dice
dice n = uniform [1 .. n]

-- | Fair dice of @4@ faces.
d4 :: Dice
d4 = dice 4

-- | Fair dice of @6@ faces.
d6 :: Dice
d6 = dice 6

-- | Fair dice of @8@ faces.
d8 :: Dice
d8 = dice 8

-- | Fair dice of @10@ faces.
d10 :: Dice
d10 = dice 10

-- | Fair dice of @12@ faces.
d12 :: Dice
d12 = dice 12

-- | Fair dice of @20@ faces.
d20 :: Dice
d20 = dice 20

-- | Rolls `n` times the given dice and sums the results.
rollsOf :: Int -> Dice -> Dice
n `rollsOf` d = n `times` d

-- | Rerolls the dice once if the first outcome satifies the given predicate.
rerollOn :: (Int -> Bool) -> Dice -> Dice
rerollOn f d = d `andThen` \ n -> if f n then d else always n
