digitoUnidades :: Integer -> Integer
digitoUnidades x  |  x < 10 = x
                  |  otherwise = x `mod` 10

digitoDecenas :: Integer -> Integer
digitoDecenas x | x < 100 = x `div` 10
                | x < 10 = 0 
                | otherwise = (x `mod` 100) `div` 10

esPar :: Integer -> Bool
esPar n = n `mod` 2 == 0

-- 1
fibonacci:: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci(n-1) + fibonacci (n-2)

-- 2
parteEntera:: Float -> Integer
parteEntera n | n >= 1 = parteEntera (n-1) + 1
              | otherwise =  0

-- 3
esDivisible :: Integer ->Integer ->Bool
esDivisible 0 m = True
esDivisible n m | (n-m) < 1 && (n-m) /= 0 = False
                | otherwise = esDivisible (n-m) m

-- 4
sumaImpares :: Integer ->Integer
sumaImpares 1 = 1
sumaImpares n = sumaImpares (n-1) + ((2*n) -1)

-- 5
medioFact :: Integer ->Integer
medioFact 0 = 1
medioFact (-1) = 1
medioFact n = medioFact (n-2) * (n)

-- 6
sumaDigitos :: Integer ->Integer
sumaDigitos 0 = 0
sumaDigitos n = sumaDigitos (n `div` 10) + n `mod` 10

-- 7
todosDigitosIguales  :: Integer -> Bool
todosDigitosIguales n | n < 10 = True
                      | (n < 100) && digitoUnidades n == digitoDecenas n = True
                      | n `mod` 10 == n `mod` 100 `div` 10 = todosDigitosIguales (n `div` 10)
                      | otherwise = False

-- 8
cantDigitos :: Integer -> Integer
cantDigitos 0 = 0
cantDigitos n = cantDigitos (n `div` 10) + 1

iesimoDigito :: Integer ->Integer ->Integer
iesimoDigito n i = (n `div` (10^ (cantDigitos(n) - i))) `mod` 10

--9
primerDigito :: Integer -> Integer
primerDigito n  = n `div` (10^ (cantDigitos (n) - 1) )

eliminarPrimerDigito :: Integer -> Integer
eliminarPrimerDigito n = n `mod` (10^ (cantDigitos (n) - 1) )

eliminarPrimerYUltimoDigito :: Integer -> Integer
eliminarPrimerYUltimoDigito n = (eliminarPrimerDigito n) `div` 10

esCapicua :: Integer ->Bool
esCapicua n | n < 10 = True
            | (n < 100) && digitoUnidades n == digitoDecenas n = True
            | primerDigito n == n `mod` 10 = esCapicua (eliminarPrimerYUltimoDigito n)
            | otherwise = False


-- 10
--a
f1 0 = 1
f1 n = (2^n) + f1(n-1)

--11
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n-1)

eAprox :: Integer -> Float
eAprox 0 = 1
eAprox n =   ((1 /fromIntegral (factorial n)) + (eAprox(n-1)))

e = eAprox 10

--12
sucs :: Integer -> Float
sucs 1 = 2
sucs n = 2 + (1/ sucs(n-1))

raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = (sucs n) - 1

--13
sumatoria1 :: Integer -> Integer -> Integer
sumatoria1 0 i = 0
sumatoria1 m i = (i^m) + sumatoria1 (m-1) i

sumatoria2 :: Integer -> Integer -> Integer
sumatoria2 n 0 = 0
sumatoria2 n i = sumatoria1 n i + sumatoria2 n (i-1)  -- recursion sobre la base 

sumatoriaDoble :: Integer -> Integer -> Integer
sumatoriaDoble n m = sumatoria2 n m

--14

--15

--16 
--a
menorDivisor :: Integer ->Integer
menorDivisor n = menorDivisorAux n 2

menorDivisorAux :: Integer -> Integer -> Integer
menorDivisorAux n i | n `mod` i == 0 = i
                    | otherwise = menorDivisorAux n (i+1)

--b
esPrimo :: Integer ->Bool
esPrimo n | n<= 1 = False
          | menorDivisor n == n = True
          | otherwise = False

--c
esMultiplo n m = n `mod` m == 0 

mcd :: Integer -> Integer ->  Integer
mcd a b | abs b > abs a = mcd b a
mcd a 0 = abs a
mcd a b = mcd b (mod a b)

sonCoprimos2 n m = mcd n m == 1 


sonCoprimos :: Integer ->Integer ->Bool --no se si esta bien
sonCoprimos n m | n == 0 || m == 0 = False
                | n == 1 || m == 1 = True
                | esMultiplo n m || esMultiplo m n = False
                | otherwise = sonCoprimos n (m `div` (menorDivisor m))

--d
nEsimoPrimoAux :: Integer ->Integer -> Integer ->Integer
nEsimoPrimoAux n i j | i == j = (n-1)
                     | not (esPrimo n) = nEsimoPrimoAux (n+1) i j
                     | otherwise = nEsimoPrimoAux (n+1) (i+1) j

nEsimoPrimo :: Integer ->Integer
nEsimoPrimo n = nEsimoPrimoAux 0 0 n

--17
esFibonacciAux :: Integer -> Integer -> Bool
esFibonacciAux n i | n < fibonacci i = False
                   | n == fibonacci i = True
                   | otherwise = esFibonacciAux n (i+1)

esFibonacci :: Integer ->Bool
esFibonacci n = esFibonacciAux n 0

--18
mayorDigitoParAux :: Integer -> Integer -> Integer
mayorDigitoParAux 0 p = p
mayorDigitoParAux n p | esPar (primerDigito n) &&  (primerDigito n) > p
                      = mayorDigitoParAux (eliminarPrimerDigito n) (primerDigito n)
                      | otherwise = mayorDigitoParAux (eliminarPrimerDigito n) p

mayorDigitoPar :: Integer ->Integer
mayorDigitoPar n = mayorDigitoParAux n (-4)

--19
--nesimo primo corre desde 1
esSumaInicialDePrimosAux  n m i | n == m = True
                                | m > n = False
                                | otherwise = 
                                esSumaInicialDePrimosAux 
                                n 
                                (m + nEsimoPrimo(i)) 
                                ((i+1))

esSumaInicialDePrimos :: Integer ->Bool
esSumaInicialDePrimos n = esSumaInicialDePrimosAux n 0 1

--21
-- n r m fijos i = n j=m
pitagorasAux n m r (-1) j = 0
pitagorasAux n m r i j | j == (-1) = pitagorasAux n m r (i-1) m
                       | condicion = (pitagorasAux n m r i (j-1)) + 1
                       | not condicion = (pitagorasAux n m r i (j-1)) 
                      where condicion = i^2 + j^2 <= r^2
-- -1 porque el 0 tmb hay q contarlo


