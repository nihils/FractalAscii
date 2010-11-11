module TextAscii where 

import Fractal

import Data.Complex

paintText :: Int -> Int -> Char -> Char 
paintText m i c = if i == m then ' ' else c

toText :: Int -> Int -> Int -> (Complex Float -> Int) -> Char -> IO ()
toText w h m f c = mapM_ putStrLn [[paintText m (f $ (r :+i)) c | r <- xCoords w] | i <- yCoords h]
