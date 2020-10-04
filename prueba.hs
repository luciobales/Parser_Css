-- split :: String -> Char -> [String]
-- split [] delim = [""]
-- split (c:cs) delim
--     | c == delim = "_" : rest
--     | otherwise = (c : head rest) : tail rest
--     where
--         rest = split cs delim

-- split :: char -> [char] -> [char]
-- split _ [] = []
-- split c x = x
-- split c (x:xs) 
--         | c == x    = xs
--         | c /= x    = x:(split c xs) 


-- Ingreso => "clase_boton-rojo"
-- y separar la cadena segun el '_'

buscarGuinBajo :: [Char] -> [Char]
buscarGuinBajo [] = []
buscarGuinBajo (x:xs) = 
                if (compararChars '_' x) == True then xs 
                else x:(buscarGuinBajo xs)
-- 
-- 

compararChars :: Char -> Char -> Bool
compararChars x y = 
                  if x == y then True 
                  else False

typeMatch :: [Char] -> [Char]
typeMatch xs
        | xs == "clase" = "Clase"
        | otherwise = "No se encontro un tipo"

split :: String -> [String]
split "" = []
split xs = let (ys, zs) = break (== '_') xs
             in  if null zs then [ys] else ys : split (tail zs)