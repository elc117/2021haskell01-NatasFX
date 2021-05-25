import Text.Printf
import Data.List {- funcao intercalate -}

-- String inicial do SVG
svgBegin :: Float -> Float -> String
-- comando printf para fazer a string com os valores...
-- me pergunto se existe algo tipo sprintf
svgBegin w h = printf "<svg width='%.2f' height='%.2f' xmlns='http://www.w3.org/2000/svg'>\n" w h 

-- String final do SVG
svgEnd :: String
svgEnd = "</svg>"

-- r, g, e b são listas q contem 358 valores para gerar a roda de cores
r :: [Float]
r = take 90 (repeat 255) ++ reverse [0,2.9..255] ++ take 90 (repeat 0) ++ [0,2.9..255] 

g :: [Float]
g = [0,2.9..255] ++ take 90 (repeat 255) ++ reverse [0,2.9..255] ++ take 90 (repeat 0)

b :: [Float]
b = take 90 (repeat 0) ++ [0,2.9..255] ++ take 90 (repeat 255) ++ reverse [0,2.9..255]

svgCircle :: Float -> Float -> Int -> String -> String 
svgCircle x y r style = 
  printf "<circle cx='%.2f' cy='%.2f' r='%d' fill='%s' />" x y r style

-- retorna uma lista de 2 elementos, o primeiro é coordenada x e o segundo, y
pos :: Float -> Float -> [Float]
pos angle size = [(cos (angle*pi/180)) * size + (250)] ++ [(sin (angle*pi/180)) * size + (250)]

-- lista de o até 360 inclusivo
angles :: [Float]
angles = [0.0,1.0..360.0]

-- gerador de string pra cada circulo impresso
genRGB :: Int -> String
genRGB i = printf "rgb(%.f, %.f, %.f, 0.8)" (r!!i) (g!!i) (b!!i)

createSvg :: Float -> String
createSvg angle = (svgCircle (head (pos (angle) 200.0)) (last (pos (angle) 200.0)) 20 (genRGB (mod (round angle) 358)))

-- Gera SVG com 2 círculos, um verde e um vermelho, com 0.4 de opacidade.
-- A opacidade pode não ser suportada em alguns visualizadores de SVG.
-- modifiquei um pouco para poder usar a nova lógica
svgAll :: String
svgAll = 
  svgBegin 500 500 ++
  (intercalate "\n" (map createSvg angles)) ++
  svgEnd

main :: IO ()
main = do
  writeFile "circles.svg" svgAll
