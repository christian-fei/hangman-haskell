import System.IO
import Diff

main :: IO ()
main = do
          putStrLn "Type in a word to guess:"
          putStr "> "
          word <- secretGetLine
          guess word
          return ()


secretGetChar :: IO Char
secretGetChar = do
                  hSetEcho stdin False
                  c <- getChar
                  hSetEcho stdin True
                  return c

secretGetLine :: IO String
secretGetLine = do
                  c <- secretGetChar
                  if c == '\n' then
                    do
                      putChar c
                      return []
                  else
                    do
                      putChar '*'
                      cs <- secretGetLine
                      return (c:cs)

guess :: String -> IO ()
guess word = do
               putStrLn "Your guess:"
               putStr "> "
               guessedWord <- getLine
               if guessedWord == word then
                 do
                   putStrLn "You won!"
               else
                 do
                   putStrLn (diff word guessedWord)
                   guess word
               return ()


