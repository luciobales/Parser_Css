import Control.Monad
-- main = do
--     line <- getLine
--     if null line
--         then return ()
--         else do
--             putStrLn $ reverseWords line
--             main

reverseWords :: String -> String
reverseWords = unwords . map reverse . words

miPutStr :: String -> IO ()
miPutStr [] = return ()
miPutStr (x:xs) = do
    putChar x
    miPutStr xs

main = do
    c <- getChar
    when (c /= ' ') $ do
        putChar c
        main