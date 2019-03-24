import Data.List (sort)
import Data.List
import System.IO (hFlush, stdout)
getMiddle [] = 0
getMiddle xs = (a' + b') `div` 2
    where a' = head $ drop a xs
          b' = head $ drop b xs
          a = (n `div` 2)
          b = n' - 1
          n' = n `div` 2
          n = length xs

median :: [Integer] -> Integer
median [] = 0
median xs = result
    where result = if (n `mod` 2 == 0)
                    then getMiddle xs 
                    else head $ drop a xs 
          a = (n - 1) `div` 2
          n = length xs
          

getMedian :: [Integer] -> Integer
getMedian xs=median xs



revList :: [a] -> [a]
revList [] = []
revList (x:xs) = (revList xs) ++ [x]



findIndexes :: Integer-> [Integer]-> [Int]
findIndexes m xs=findIndices (==m) xs

readNumber :: [Integer] -> IO [Integer]
readNumber numbers = do
     line <-getLine
     case line of 
      "exit" -> pure numbers
      _->case reads line of 
        [(number, "")]-> readNumber (number : numbers)
        _->readNumber numbers


main:: IO()
main =do
  putStr("Enter list (exit to stop) \n")
  numbers <- readNumber []
  let mymed= median numbers
  let sortedNumbers= revList numbers
  let indexes= findIndexes mymed sortedNumbers
  putStr(" \nList:  ")
  print (sortedNumbers)
  putStr(" \nMedian:  ")
  print(mymed)
  putStr(" \nIndexes:  ")
  print(indexes)


