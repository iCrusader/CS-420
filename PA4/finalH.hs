import System.Environment

subtractBy1 :: [Int] -> [Int]
subtractBy1 [] = []
subtractBy1 (x:xs) = ((255-x) ): subtractBy1 xs

main :: IO ()
main = do
    args <- getArgs
    let numbers = map read args :: [Int]
        result = subtractBy1 numbers
        resultStrings = map show result
        outputString = unwords resultStrings
    putStrLn outputString
