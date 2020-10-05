import System.IO

main = do

    handle <- openFile "andGeraltSaid.txt" ReadMode
    -- Utilizo la funcion OpenFile que recibe el path del archivo que quiero leer. 
    -- Y indico el modo 'ReadMode', 'WriteMode', etc.
    -- Esto me devuelve un IO Handle. Que me permite manipular mi archivo.

    contents <- hGetContents handle
    -- La funcion 'hGetContents' toma mi handle y lee el contenido. 
    -- Y lo almacena en 'contents' 

    putStr contents
    -- Imprimo el contenido que almacene en 'contents'
    
    hClose handle
    -- Paso mi manipulador por la funcion 'hClose' para cerrar el archivo.
