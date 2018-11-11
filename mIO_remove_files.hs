{--
В этом задании ваша программа должна попросить пользователя ввести любую строку, а затем удалить все файлы в текущей директории, в именах которых содержится эта строка, выдавая при этом соответствующие сообщения.
--}

import Data.List

main' :: IO ()
main' = do
    putStr "Substring: "
    name <- getLine
    if name == "" 
        then 
            putStrLn "Canceled"
        else do
            allFiles <- getDirectoryContents "."
            filtred <- fmap (filter (isInfixOf name)) (getDirectoryContents ".")
            mapM_ (\x -> (putStrLn $ "Removing file: " ++ x) >> removeFile x) filtred