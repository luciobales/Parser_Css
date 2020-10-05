import System.IO
import System.Directory
import Data.List

main = do
    handle <- openFile "todo.txt" ReadMode
    -- Agarro y abro el archivo en modo 'lectura' y 
    -- el handler del mismo se los asigno a 'handle' 

    (tempName, tempHandle) <- openTempFile "." "temp"
    -- Creo un archivo temporal en base al original...
    -- esto es para poder trabajar de manera segura sin perder el contenido original en el archivo 'todo.txt'

    contents <- hGetContents handle
    -- Asigno a contents el contenido del archivo 'todo.txt'

    let todoTasks = lines contents
    -- El contenido del archivo lo separo el listas de cadena, una cadena por linea.

        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
        -- Inserto al principio de cada linea un '-' y un numero secuencialmente.
        -- Ejemplo => 0 - Ir al super

    putStrLn "These are your TO-DO items:"
    -- Imprimo por terminarl "These are your TO-DO items:"

    putStr $ unlines numberedTasks
    -- Muestro las tareas que tiene el usuario.

    putStrLn "Which one do you want to delete?"
    -- Imprimo "Which one do you want to delete?"

    numberString <- getLine
    -- Esperamos que por teclado se ingrese un string que vamos a guardar en 'numberString'

    let number = read numberString
    -- Hago una especie de transformacion del numero ingresado de string a number utilizando la funcion read.
    -- Ejemplo numberString era "1" y en number tengo 1. Castie los tipos.

        newTodoItems = delete (todoTasks !! number) todoTasks
        -- (todoTasks !! number) devuelve un elemento de una lista (todoTasks) segun un indice (number)
        -- y delete elimina un elemento de una lista que machee con una lista.

        -- Por lo tanto lo que hacemos es obtener el elemento de la lista segun el numero ingresado
        -- y buscamos ese elemento en la lista para eliminarlo. Y esa nueva lista la asignamos a newTodoItems.

    hPutStr tempHandle $ unlines newTodoItems
    -- Hacemos un unlines de mi nuevo lista de tareas para tener todo en una sola cadena. Ya que antes lo teniamos separado en cadenas.
    -- y asignamos el contenido a tempHandle

    hClose handle
    -- Cerramos el archivo original.
    hClose tempHandle
    -- Cerramos el archivo temporal.
    removeFile "todo.txt"
    -- Borramos el archivo original.
    renameFile tempName "todo.txt"
    -- Renombramos el archivo temporal a 'todo.txt'
