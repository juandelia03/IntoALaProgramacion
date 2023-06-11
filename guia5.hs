esPar :: Integer -> Bool
esPar n = n `mod` 2 == 0

esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe x y | (x `mod` y) == 0 = True
                 | otherwise = False


--Ejercicio 1
--1.1
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = longitud xs + 1

--1.2
ultimo :: [t] -> t
ultimo x = head (reverso x) 

--1.4
reversoAux :: [t] -> [t] -> [t]
reversoAux [] y = y
reversoAux (x:xs) y = reversoAux xs (x:y)

reverso :: [t] -> [t]
reverso x = reversoAux x []

--Ejercicio 2
--2.1
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece n [] = False
pertenece n (x:xs) | n == x = True 
                   | otherwise = pertenece n xs 

--2.2
todosIguales :: (Eq t) => [t] -> Bool
todosIguales (x:xs) | longitud (x:xs) == 1 = True
                    | x /= head xs = False
                    | otherwise = todosIguales xs

--2.3
todosDistintos  :: (Eq t) => [t] -> Bool
todosDistintos x = todosDistintosAux x [] 

todosDistintosAux  :: (Eq t) => [t] -> [t] -> Bool
todosDistintosAux  [] y = True
todosDistintosAux  (x:xs) y | pertenece (x) y = False
                       | otherwise = todosDistintosAux xs (x:y)

--2.4
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos x = not (todosDistintos x)

--2.5
quitarAux :: (Eq t) => t -> [t] -> [t] -> [t]
quitarAux n [] y = reverso y
quitarAux n (x:xs) y | n /= x = quitarAux n xs (x:y)  
                     | otherwise = (reverso y) ++ xs

quitar :: (Eq t) => t -> [t] -> [t]
quitar n xs = quitarAux n xs []

--2.6
quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos n xs | pertenece n xs = quitarTodos n (quitar n xs)
                 | otherwise = xs

--2.7
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos x = eliminarRepetidosAux x []

eliminarRepetidosAux :: (Eq t) => [t] -> [t] -> [t]
eliminarRepetidosAux [] ys = reverso ys
eliminarRepetidosAux (x:xs) ys | pertenece x ys = eliminarRepetidosAux xs ys
                               | otherwise = eliminarRepetidosAux xs (x:ys)

--2.8
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos x y | (longitud (eliminarRepetidos x)) == (longitud (eliminarRepetidos y)) = mismosElementosAux (eliminarRepetidos x) (eliminarRepetidos y)
                    | otherwise = False

mismosElementosAux :: (Eq t) => [t] -> [t] -> Bool
mismosElementosAux [] _ = True
mismosElementosAux (x:xs) (ys) | pertenece x ys = mismosElementosAux xs ys
                            | otherwise = False

--2.9
capicua [] = True
capicua (x:xs) | longitud (x:xs) == 1 = True
               | x == head (reverso (x:xs)) = capicua  (reverso (tail (reverso xs))) 
               | otherwise = False


--Ejercicio 3
--3.1
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs 

--3.2
productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs

--3.3
maximo :: [Integer] -> Integer
maximo xs = maximoAux xs 0

maximoAux :: [Integer] -> Integer -> Integer
maximoAux [] n = n
maximoAux (x:xs) n | x > n = maximoAux xs x
                   | otherwise = maximoAux xs n

--3.4
sumarNAux :: Integer -> [Integer] -> [Integer]-> [Integer] 
sumarNAux n [] ys = reverso ys
sumarNAux n (x:xs) ys = sumarNAux n xs ((x+n):ys)

sumarN :: Integer -> [Integer] -> [Integer]
sumarN n xs = sumarNAux n xs []

--3.5
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero xs = sumarN (head xs) xs 

--3.6
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo xs = sumarN (head(reverso xs)) xs

--3.7
paresAux :: [Integer] -> [Integer] -> [Integer]
paresAux [] ys = reverso ys
paresAux (x:xs) ys | esPar x = paresAux xs (x:ys)
                   | otherwise = paresAux xs ys

pares :: [Integer] -> [Integer]
pares xs = paresAux xs []

--3.8
multiplosDeNAux :: [Integer] -> [Integer] -> Integer -> [Integer]
multiplosDeNAux [] ys n = reverso ys
multiplosDeNAux (x:xs) ys n | esMultiploDe x n = multiplosDeNAux xs (x:ys) n
                            | otherwise = multiplosDeNAux xs ys n

multiplosDeN :: [Integer] -> Integer -> [Integer]
multiplosDeN xs n = multiplosDeNAux xs [] n

--3.9
ordenar :: [Integer] -> [Integer]
ordenar xs = ordenarAux xs []

ordenarAux :: [Integer] -> [Integer] -> [Integer]
ordenarAux [] ys = ys
ordenarAux xs ys = ordenarAux  (quitar (maximo xs) xs) (maximo xs:ys)

--Ejercicio 4

--1
empiezaConBlanco (x:xs) = (x == ' ')

sacarBlancosRepetidosAux :: [Char] -> [Char] -> Char -> [Char]
sacarBlancosRepetidosAux [] ys a = reverso ys
sacarBlancosRepetidosAux (x:xs) ys  a | a == ' ' && x == ' ' =
                                       sacarBlancosRepetidosAux xs ys x
                                      | otherwise = sacarBlancosRepetidosAux xs (x:ys) x

sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos xs | empiezaConBlanco xs = sacarBlancosRepetidosAux xs [' '] ' '
                         | otherwise = sacarBlancosRepetidosAux xs [] ' '

--2

sinUltimo :: [t] -> [t]
sinUltimo xs = reverso (tail (reverso xs))

sacarBlancosRepetidosYDeLasPuntas :: [Char] -> [Char] 
sacarBlancosRepetidosYDeLasPuntas xs = sacarBlancosRepetidosYDeLasPuntasAux (sacarBlancosRepetidos xs)

sacarBlancosRepetidosYDeLasPuntasAux :: [Char] -> [Char]
sacarBlancosRepetidosYDeLasPuntasAux " " = ""
sacarBlancosRepetidosYDeLasPuntasAux (x:xs) | x == ' ' && ultimo xs == ' ' = sinUltimo xs
                                            | x == ' ' = xs
                                            | ultimo xs == ' ' = sinUltimo (x:xs)
                                            | otherwise = (x:xs)

contarBlancos:: [Char] -> Integer
contarBlancos xs = contarBlancosAux (sacarBlancosRepetidosYDeLasPuntas xs)

contarBlancosAux:: [Char] -> Integer
contarBlancosAux [] = 0
contarBlancosAux (x:xs) | x == ' ' = contarBlancosAux xs + 1
                        | otherwise = contarBlancosAux xs

todosBlancos :: [Char] -> Bool
todosBlancos xs = todosIguales xs && pertenece ' ' xs

contarPalabras :: [Char] -> Integer
contarPalabras xs | todosBlancos xs = 0
                  |  otherwise = contarBlancos xs + 1

--4
palabras :: [Char] -> [[Char]]
palabras xs = palabrasAux (sacarBlancosRepetidosYDeLasPuntas xs) [] []  (contarPalabras xs)


palabrasAux [] ys rs k = reverso ((reverso ys):rs)
palabrasAux (x:xs) ys rs  k  | longitud rs == k = rs
                             | x == ' ' = palabrasAux xs [] ((reverso ys):rs) (k+1) 
                             | otherwise = palabrasAux xs (x:ys) rs k

--3
palabraMasLargaAux [] p = p
palabraMasLargaAux (x:xs) p | longitud x >= longitud p = palabraMasLargaAux xs x
                            | otherwise = palabraMasLargaAux xs p

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga xs = palabraMasLargaAux (palabras xs) []

--5
aplanarAux :: [[Char]] ->[Char] -> [Char]
aplanarAux [] ys= ys
aplanarAux (x:xs) ys = x++ys ++ (aplanarAux xs ys)

aplanar :: [[Char]] -> [Char]
aplanar xs = aplanarAux xs []

--6
aplanarConBlancosAux [] ys=  ys
aplanarConBlancosAux (x:xs) ys = (reverso ((' '):(reverso (x))))++ys ++ (aplanarConBlancosAux xs ys)

aplanarConBlancos xs = sinUltimo (aplanarConBlancosAux xs [])

-- falta sacarle los n blancos del principio
aplanarConNBlancosAux :: [[Char]] -> Integer -> [Char]
aplanarConNBlancosAux [] n = []
aplanarConNBlancosAux (x:xs) n = (agregarNBlancosAdelante (x) n) ++ aplanarConNBlancosAux xs n


agregarNBlancosAdelante :: [Char] -> Integer -> [Char]
agregarNBlancosAdelante p 0 = p
agregarNBlancosAdelante p n = ' ' : agregarNBlancosAdelante p (n-1)


sumaAcumulada :: (Num t) => [t] -> [t] 
sumaAcumulada (x:xs) = sumaAcumuladaAux (x:xs) x

sumaAcumuladaAux [] i = []
sumaAcumuladaAux (x:xs) i = i : sumaAcumuladaAux xs (i+(head xs)) 

agregarATodos :: Integer -> [[Integer]] -> [[Integer]]
agregarATodos n [] = []
agregarATodos n (x:xs) = (n:x): agregarATodos n xs


partes :: Integer -> [[Integer]]
partes 0 = [[]]
partes x = partes (x-1) ++ agregarATodos x (partes (x-1))


