module Fractal where

import Data.Complex

-- Complex Plane
xCoords :: Int -> [Float]
xCoords w = [-2.0 + (fromIntegral x) * (3.0 / (fromIntegral w)) | x <- [0..w-1]]

yCoords :: Int -> [Float]
yCoords h = [-1.0 + (fromIntegral y) * (2.0 / (fromIntegral h)) | y <- [0..h-1]]

-- Escape Time Fractals 
mandelbrot :: Int -> Complex Float -> Int 
mandelbrot m c = length $ takeWhile (\z -> magnitude z <= 2) (take m (iterate (\z -> z^2 + c) c))

multibrot :: Int -> Int-> Complex Float -> Int 
multibrot m d c = length $ takeWhile (\z -> magnitude z <= 2) (take m (iterate (\z -> z^d + c) c))

multibar :: Int -> Int-> Complex Float -> Int 
multibar m d c = length $ takeWhile (\z -> magnitude z <= 2) (take m (iterate (\z -> (conjugate z)^d + c) c))

-- TODO: Newton method
newton :: Int -> (Complex Float -> Complex Float) -> Complex Float -> Int 
newton m f z0 = length $ takeWhile (\z -> magnitude z <= 2) (take m (iterate f z0))

-- TODO: Parsing of Custom Formula
formula :: Int -> (Complex Float -> Complex Float) -> Complex Float -> Int
formula m f z0 = length $ takeWhile (\z -> magnitude z <= 2) (take m (iterate f z0))
