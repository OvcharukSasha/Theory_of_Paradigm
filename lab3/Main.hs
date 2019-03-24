import Data.List (sort)
import Data.List
import System.IO (hFlush, stdout)

ascend :: Ord a => [a] -> [[a]]
ascend xs = foldr f [] xs
  where
    f a []  = [[a]]
    f a xs'@(y:ys) | a < head y = (a:y):ys
                   | otherwise = [a]:xs'


