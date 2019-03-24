import Data.List (sort)
import Data.List
import System.IO (hFlush, stdout)

listFromPosNat3 []=[]
listFromPosNat3 xs =[y | (x, y) <- zip [1..] xs , x `elem` (take x listNat3)]

listNat3 = map (\x -> x*x*x) [1..10]

readNumber :: [Integer] -> IO [Integer]
readNumber numbers = do
     line <-getLine
     case line of 
      "exit" -> pure numbers
      _->case reads line of 
        [(number, "")]-> readNumber (number : numbers)
        _->readNumber numbers

revList :: [a] -> [a]
revList [] = []
revList (x:xs) = (revList xs) ++ [x]

main :: IO ()
main = do
      putStr("Enter list (exit to stop) \n")
      numbers <- readNumber []
      let sortedNumbers= revList numbers
      let listPosNat3 = listFromPosNat3 sortedNumbers
      print (listPosNat3)


