--ej 1
f :: Int -> Int
f 1 = 8
f 4 = 131 
f 16 =16

g :: Int -> Int
g 8 = 16
g 16 = 4
g 131 = 1

h :: Int -> Int
h x = f (g x)

k :: Int -> Int
k x = g (f x)

--ej 2

absoluto :: Int -> Int
absoluto x | x >= 0 = x
           | otherwise = (-1)*x

maximoabsoluto :: Int -> Int -> Int
maximoabsoluto x y | absoluto x >= absoluto y = absoluto x
                   | otherwise = absoluto y

maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z | (a >= b) && (a >= c)  = a
              | (b >= a) && (b >= c)  = b
              | (c >= b) && (c >= a)  = c
              where
                a = absoluto x
                b = absoluto y
                c = absoluto z

algunoEs0 :: Float -> Float -> Bool
algunoEs0 _ 0 = True
algunoEs0 0 _ = True
algunoEs0 _ _ = False

ambosSon0 :: Float -> Float -> Bool
ambosSon0 0 0 = True
ambosSon0 _ _ = False

mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y | (x <= 3) && (y <= 3) = True
                   | (x > 3) && (x <= 7) && (y > 3) && (y <= 7) = True
                   | (x > 7) && (y > 7) = True
                   | otherwise = False


sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos x y z | a && b && c =  x + y + z -- todos distintos
                    | a && b = x + y  -- z = y
                    | a && c = z + y   --  z = x 
                    | b && c = x + z    -- x = y
                    | otherwise = x
                    where 
                      a = x /= y
                      b = x /= z
                      c = y /= z

esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y | (x `mod` y) == 0 = True
                 | otherwise = False

digitoUnidades :: Int -> Int
digitoUnidades x  |  x < 10 = x
                  |  otherwise = x `mod` 10

digitoDecenas :: Int -> Int
digitoDecenas x | x < 100 = x `div` 10
                | x < 10 = 0 
                | otherwise = (x `mod` 100) `div` 10


-- ejercicio 3
estanRelacionados :: Int -> Int -> Bool 
estanRelacionados a b | (a `mod` b == 0) = True -- xq a*a + a*b*k = 0
                      | otherwise = False       -- es igual a a/b = -k
                                               -- entonces basta con ver que a/b es entero

--ejercicio 4
prodInt :: (Float,Float) -> (Float,Float) -> Float
prodInt v w = (fst v * fst w) + (snd v * snd w )

todoMenor :: (Float,Float) -> (Float,Float) -> Bool
todoMenor v w | (fst v < fst w) && (snd v < snd w) = True
              | otherwise = False

distanciaPuntos :: (Float,Float) -> (Float,Float) -> Float
distanciaPuntos v w = sqrt ( (fst v - fst w)^2 + (snd v - snd w)^2)

sumaTerna :: (Int,Int,Int) -> Int
sumaTerna (x,y,z) = x+y+z

sumarSoloMultiplos :: (Int,Int,Int) -> Int ->Int
sumarSoloMultiplos (x,y,z) n | a && b && c = x+y+z
                             | a && b = x + y
                             | a && c = x + z
                             | b && c = y +z
                             | a = x
                             | b = y
                             | c = z
                             | otherwise = 0
                            where 
                              a = esMultiploDe x n 
                              b = esMultiploDe y n
                              c = esMultiploDe z n

posPrimerPar :: (Int,Int,Int) -> Int
posPrimerPar (x,y,z) | esPar x = 1
                     | esPar y  = 2
                     | esPar z = 3
                     | otherwise = 4

crearPar :: tx -> ty -> (tx,ty)
crearPar a b = (a,b)

invertir :: (tx,ty) -> (ty,tx)
invertir v = (snd v,fst v) 

--ejercicio 5

esPar :: Int -> Bool
esPar n = n `mod` 2 == 0

problemaF :: Int -> Int
problemaF n | n <= 7 = n*n
            | n > 7 = ((2*n)-1)

problemaG :: Int -> Int
problemaG n | esPar n = n `div` 2 
            | otherwise = ((3*n) + 1)

todosMenores :: (Int,Int,Int) -> Bool
todosMenores (x,y,z) | (problemaF x > problemaG x) && 
                       (problemaF y > problemaG y) && 
                       (problemaF z > problemaG z) = True
                     | otherwise = False

--ejercicio 6

bisiesto :: Int -> Bool
bisiesto x | not (esMultiploDe x 4) || esMultiploDe x 100 && not (esMultiploDe x 400) = False
           | otherwise = True

--ejercicio 7

absolutoFloats :: Float -> Float
absolutoFloats x | x >= 0 = x
           | otherwise = (-1)*x

distanciaManhattan ::  (Float, Float, Float) ->(Float, Float, Float) ->Float
distanciaManhattan (x,y,z) (a,b,c) = absolutoFloats((x-a)+(y-b)+(z-c))

-- ejercicio 8

sumaUltimosDosDigitos :: Int -> Int
sumaUltimosDosDigitos x = digitoUnidades x + digitoDecenas x

comparar :: Int -> Int ->Int
comparar a b | x < y = 1
             | x > y = -1
             | x == y = 0
             where
              x = sumaUltimosDosDigitos a
              y =sumaUltimosDosDigitos b