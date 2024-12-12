{-
  Author: Rebecca Ostrander, Kevin Ryan 
  Filename: VScodeExamples.curry 
  Purpose: To give VS code examples of data strutcures, concurrecncy, map/reduce/filter, and tail recurson.
-}

{-~~~~~~~~~~~~~~~~-}
{-Data Structures:-} 
{-A few examples of some of the data structures found in Curry-}
{-~~~~~~~~~~~~~~~~-}
{-Lists-}
emptyList = [] {-An empty list-}
fullList = [1,2,3,4,5] {-A list with 5 elements-}

conc [] ys = ys {-concatinated two lists-}
conc (x:xs) ys = x : conc xs ys

rev [] = [] {-reverses lists-}
rev (x:xs) = conc (rev xs) [x]

{-Tuples-}
data Pair a b = Pair a b
myPair :: Pair Int String
myPair = (42, "Hello")

largest :: String-> (Int,Width) {-The type of a tuple is represented as a tuple as well-}

{-Trees-}
data BinTree a = Leaf | Branch a (BinTree a) (BinTree a) {-a binary tree-}

insert x Leaf = Branch x Leaf Leaf {-function to insert values into a binary tree (results in another tree)-}
insert x (Branch d l r)
  | x < d = Branch d (insert x l) r
  | x > d = Branch d l (insert x r)
  | otherwise = Branch d l r

inorder Leaf = [] {-traversing a binary tree-}
inorder (Branch d l r) = inorder l ++ [d] ++ inorder r

data Tree a = Tree a [Tree a] {-a trie tree-}

type Trie = [Tree Char] {-character trie tree ex-}

insert :: String-> Trie-> Trie {-function to insert a char into a trie tree-}
insert [] t = (Tree ’.’ [] : t)
insert (w:ws) [] = [Tree w (insert ws [])]
insert (w:ws) (Tree c cs : ts)
  | ord w < ord c = insert (w:ws) [] ++ (Tree c cs : ts)
  | ord w > ord c = Tree c cs : insert (w:ws) ts
  | otherwise = Tree c (insert ws cs) : ts

{-Sets-}
{-library Control.Search.SetFunctions-}
subset [] = []
subset (x:xs) = x:subset xs
subset (_:xs) = subset xs

powerset s = set1 subset s {-powerset is the set function of subset-}

{-~~~~~~~~~~~~~~~~-}
{-Concurrency:-}
{-~~~~~~~~~~~~~~~~-}
{-non-deterministic computation; finding an element in a list-}
findElement :: Eq a => a -> [a] -> Bool
findElement _ [] = False
findElement x (y:ys) = (x == y) \/ findElement x ys

{-lazy evaluation -> lazy list-}
fibStream :: Stream Int {} {-infinite Fibonacci stream-}
fibStream = fib 0 1
  where
    fib x y = x : fib y (x + y)

first10Fibs :: [Int] {-first 10 Fibonacci numbers-}
first10Fibs = take 10 fibStream


{-~~~~~~~~~~~~~~~~-}
{-Map/Reduce/Filter:-}
{-~~~~~~~~~~~~~~~~-}

{-Map-}
map :: (a->b)-> [a]-> [b]
map _ [] = []
map f (x:xs) = f x : map f xs

{-Reduce/Fold-}
foldr :: (a->b->b)-> b-> [a]-> b
foldr _ z [] = z
foldr f z (x:xs) = f x (foldr f z xs)

{-Filter-}
filter :: (a-> Bool)-> [a]-> [a]
filter _ [] = []
filter p (x:xs) = if p x then x : filter p xs else filter p xs

{-~~~~~~~~~~~~~~~~-}
{-Tail Recursion:-}
{-~~~~~~~~~~~~~~~~-}
{-Factorial-}
factorial :: Int -> Int
factorial n = factorialAux n 1
  where
    factorialAux 0 acc = acc
    factorialAux n acc = factorialAux (n - 1) (n * acc)

{-Summation (of a list)-}
sumList :: [Int] -> Int
sumList xs = sumListAux xs 0
  where
    sumListAux [] acc = acc
    sumListAux (x:xs) acc = sumListAux xs (acc + x)

{-Reversing (a list)-}
reverseList :: [a] -> [a]
reverseList xs = reverseAux xs []
  where
    reverseAux [] acc = acc
    reverseAux (x:xs) acc = reverseAux xs (x : acc)


