module Test where
-- Prática 01 de Haskell - Parte 1
-- Nome: Natã Schmitt

sumSquares :: Int -> Int -> Int
sumSquares x y = x^2 + y^2

circleArea :: Float -> Float
circleArea r = pi*r^2

age :: Int -> Int -> Int
age anoNasc anoAtual = anoAtual - anoNasc

isElderly :: Int -> Bool
isElderly age = age > 65

htmlItem :: String -> String
-- Em html não é <\li> e sim </li>
htmlItem str = "<li>" ++ str ++ "</li>"

startsWithA :: String -> Bool
startsWithA str = str!!0 == 'A'

isVerb :: String -> Bool
isVerb str = str!!(length str-1) == 'r'

isVowel :: Char -> Bool
isVowel c = c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u'

hasEqHeads :: [Int] -> [Int] -> Bool
hasEqHeads listA listB = head listA == head listB

isVowel2 :: Char -> Bool
isVowel2 c = elem c "aeiouAEIOU"




