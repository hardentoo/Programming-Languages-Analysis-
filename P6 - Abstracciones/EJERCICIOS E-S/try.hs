import System.Environment
import System.IO
import Data.Char

main = do
    source:destination:_ <- getArgs
    contents <- readFile source
    writeFile destination (map toUpper contents)



-- runhaskell try.hs girlfriend.txt girlfriendcaps.txt
