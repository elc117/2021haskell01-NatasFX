-- Prática 01 de Haskell - Parte 2
-- Nome: Natã Schmitt

--Importando funções da parte 1
import Test
import Quickstart

itemize :: [String] -> [String]
itemize list = map htmlItem list

onlyVowels :: String -> String
onlyVowels str = filter isVowel2 str

onlyElderly :: [Int] -> [Int]
onlyElderly ages = filter isElderly ages

onlyLongWords :: [String] -> [String]
onlyLongWords strings = filter isLongWord strings

onlyEven :: [Int] -> [Int]
onlyEven intList = filter (\n -> mod n 2 == 0) intList

onlyBetween60and80 :: [Int] -> [Int]
onlyBetween60and80 intList = filter (\n -> n >= 60 && n <= 80) intList

countSpaces :: String -> Int
countSpaces str = length (filter (' '==) str)

calcAreas :: [Float] -> [Float]
calcAreas floatList = map circleArea floatList

charFound :: Char -> String -> Bool
charFound chr str = any (chr==) str
