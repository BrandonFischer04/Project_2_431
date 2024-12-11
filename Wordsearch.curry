{-
  Author: Kevin Ryan  
  Filename: Wordseach.curry 
  Purpose: A Word Search Program in Curry. This program reads a list of words from a file and allows the user to search 
  for words matching a given pattern. The pattern can include blanks ('_') 
  that match any letter. For example, entering the pattern 'se_' will find all 
  words starting with 'se' and followed by any single character.
-}
  
import System.IO

-- Match a word with a pattern
matchPattern :: String -> String -> Bool
matchPattern [] [] = True
matchPattern ('_':ps) (_:ws) = matchPattern ps ws
matchPattern (p:ps) (w:ws) | p == w = matchPattern ps ws
matchPattern _ _ = False

-- Find all matching words from a list
findWords :: String -> [String] -> [String]
findWords pattern words = [word | word <- words, matchPattern pattern word]

-- Read word list from a file
loadWordList :: FilePath -> IO [String]
loadWordList filePath = do
  contents <- readFile filePath
  return (lines contents)

-- Main program
main :: IO ()
main = do
  let filePath = "C:\\Homework Assignments\\Principles431\\word.txt"
  wordList <- loadWordList filePath
  putStrLn "Enter a word pattern with blanks (use '_' for blanks, e.g., 'se_'):"
  pattern <- getLine
  let matches = findWords pattern wordList
  if null matches then
    putStrLn "No Words Found"
  else
    putStrLn ("Words matching pattern '" ++ pattern ++ "': " ++ show matches)
