buscarGuinBajo :: [Char] -> [Char]
buscarGuinBajo [] = []
buscarGuinBajo (x:xs) = 
                if (compararChars '_' x) == True then xs 
                else x:(buscarGuinBajo xs)

compararChars :: Char -> Char -> Bool
compararChars x y = 
                  if x == y then True 
                  else False

typeMatch :: [Char] -> [Char]
typeMatch xs
        | xs == "clase" = "."
        | xs == "id" = "#"
        | otherwise = xs

split :: String -> [String]
split "" = []
split xs = let (ys, zs) = break (== '_') xs
             in  if null zs then [ys] else ys : split (tail zs)