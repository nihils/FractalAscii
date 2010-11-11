import Fractal
import TextAscii

import Data.Complex

import System
import System.Console.GetOpt

data Options = Options
 { optFractalName :: String
 , optChar :: Char
 , optMax :: Int
 , optDegree :: Int
 , optWidth :: Int
 , optHeight :: Int
 }

defaults = Options 
 { optFractalName = "mandelbrot"
 , optChar = '*'
 , optMax = 400
 , optDegree = 0
 , optWidth = 60
 , optHeight = 30
 }

options :: [OptDescr (Options -> Options)] 
options = 
    [ Option ['f'] ["fractal"] 
      (ReqArg (\s opts -> opts {optFractalName = s}) "STRING") 
      "mandelbrot | multibrot | multibar | tricorn" 
    , Option ['c'] ["char"] 
      (ReqArg (\c opts -> opts {optChar = head c}) "CHAR")
      "What character you would like to use to paint the fractal"
    , Option ['m'] ["max"] 
      (ReqArg (\m opts -> opts {optMax = read m :: Int}) "INT") 
      "Maximum number of iterations"
    , Option ['d'] ["degree"] 
      (ReqArg (\d opts -> opts {optDegree = read d :: Int}) "INT") 
      "Degree of polynomial for multibrot and multibar fractals"
    , Option ['w'] ["width"] 
      (ReqArg (\w opts -> opts {optWidth = read w :: Int}) "INT") 
      "Width of resulting fractal"
    , Option ['h'] ["height"] 
      (ReqArg (\h opts -> opts {optHeight = read h :: Int}) "INT") 
      "Height of resulting fractal"
    ]
    
parseFractalName :: Options -> (Complex Float -> Int) 
parseFractalName o = case (optFractalName o) of 
			"mandelbrot" -> mandelbrot (optMax o)
			"multibrot" -> multibrot (optMax o) (optDegree o)
			"multibar" -> multibar (optMax o) (optDegree o)
			"tricorn" -> multibar (optMax o) 2 

parseOptions :: [String] -> IO Options 
parseOptions args = case getOpt Permute options args of
		  (o,_,[]) -> return (foldl (flip id) defaults o) 
		  (_,_,e) -> ioError (userError (concat e ++ usageInfo header options))
		  where header = "Usage: fractalascii [OPTIONS]" 

-- Entry Point
main :: IO ()
main = do 
    argv <- getArgs
    opts <- parseOptions argv
    toText (optWidth opts) (optHeight opts) (optMax opts) (parseFractalName opts) (optChar opts)
