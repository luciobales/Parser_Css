-- Ingreso => "clase_boton-rojo"
-- y separar la cadena segun el '_'

-- La estructura que tendria que formar seria la siguiente:
-- .boton-rojo {
-- 
-- }

-- Otro ejemplo
-- La estructura que tendria que formar seria la siguiente:
-- Ingreso "div" 
-- div {
-- 
-- }

-- Otro ejemplo
-- La estructura que tendria que formar seria la siguiente:
-- Ingreso "id_contenedor" 
-- #contenedor {
-- 
-- }

-- Otro ejemplo
-- La estructura que tendria que formar seria la siguiente:
-- Ingreso "div_clase_contenedor-rojo" 
-- div.contenedor-rojo {
-- 
-- }

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