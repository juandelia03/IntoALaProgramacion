import random
import numpy as np


# 1
def sumaTotal(l):
    res = 0
    for i in l:
        res += i
    return res


def ordenados(l):
    n = l[0]
    for i in l:
        if i >= n:
            n = i
        else:
            return False
    return True


def algunaMas7(l):
    for i in l:
        if len(i) > 7:
            return True
    return False


def palindroma(palabra: str) -> bool:
    inversoPalabra = ""
    for l in palabra:
        inversoPalabra = l + inversoPalabra
    return inversoPalabra == palabra


def tieneNumero(palabra):
    for i in palabra:
        if i.isdigit():
            return True
    return False


def calidadContra(contra: str) -> str:
    if len(contra) < 5:
        return "roja"
    elif (
        (len(contra) > 8)
        and (not (contra.isupper()) and not (contra.islower()))
        and (tieneNumero(contra))
    ):
        return "verde"
    else:
        return "amarillo"


def banco(l: list) -> int:
    saldo: int = 0
    for i in l:
        if i[0] == "R":
            saldo -= i[1]
        else:
            saldo += i[1]
    return saldo


def tresVocalesDistintas(palabra: str) -> bool:
    vocales: list = ["a", "e", "i", "o", "u"]
    vocales_palabra: list = []
    for p in palabra:
        if p in vocales and not (p in vocales_palabra):
            vocales_palabra.append(p)
    return len(vocales_palabra) >= 3


# Segunda parte


# 2
def es_par(n: int) -> bool:
    if n % 2 == 0:
        return True
    else:
        return False


def borrarPosPar(l: list) -> list:
    for i in range(len(l)):
        if es_par(i):
            l[i] = 0
    return l


def borrarPosParClon(l: list) -> list:
    lista_clon: list = l
    for i in range(len(lista_clon)):
        if es_par(i):
            lista_clon[i] = 0
    return lista_clon


def palabra_sin_vocales(palabra) -> str:
    vocales: list = ["a", "e", "i", "o", "u"]
    res: str = ""
    for letra in palabra:
        if letra not in vocales:
            res += letra
    return res


def reemplazaVocales(palabra: str) -> str:
    res: str = ""
    vocales: list = ["a", "e", "i", "o", "u"]
    for letra in palabra:
        if letra not in vocales:
            res += letra
        else:
            res += "_"
    return res


def daVueltaStr(palabra: str) -> str:
    res: str = ""
    for letra in palabra:
        res = letra + res
    return res


# 3
def nombreEstudiantes() -> list:
    actual: str = ""
    nombres: list = []
    while actual != "listo":
        actual = input()
        nombres.append(actual)
    nombres.pop()
    return nombres


# entiendo que no tengo que devolver el balance, solo el historial
def monedero() -> list:
    historial: list = []
    actual: str = ""
    while actual != "x":
        actual = input("seleccionar operacion (c: cargar, d: descontar, x: finalizar)")
        if actual == "c":
            historial.append(("C", input("monto a cargar: ")))
        elif actual == "d":
            historial.append(("D", input("monto a descontar: ")))
        else:
            print("caracter invalido")

    return historial


def siete_y_medio() -> list:
    posibles: list = [1, 2, 3, 4, 5, 6, 7, 10, 11, 12]
    eleccion: str = ""
    contador: float = random.choice(posibles)
    if contador > 9:
        contador = 0.5
    cartas: list = [contador]
    while eleccion != "plantarse":
        if contador > 7.5:
            break
        print(cartas[-1])
        eleccion = input("sacar o plantarse?: ")
        if eleccion == "sacar":
            cartas.append(random.choice(posibles))
            print("salio " + str(cartas[-1]))
            if cartas[-1] < 9:
                contador += cartas[-1]
            else:
                contador += 0.5
    return cartas


print(siete_y_medio())


def perteneceACadaUno(l, e):
    res = []
    for i in l:
        if e not in i:
            res.append(False)
        else:
            res.append(True)
    return res


def esMatriz(matriz: list[list[int]]) -> bool:
    if len(matriz) > 0 and len(matriz[0]) > 0:
        for fila in matriz:
            if len(fila) != len(matriz[0]):
                return False
        return True
    else:
        return False


def filasOrdenadas(matriz) -> bool:
    for fila in matriz:
        if not ordenados(fila):
            return False
    return True


def invertir_matriz(matriz):
    fila_actual = []
    res = []
    counter = 0
    while len(res) != len(matriz):
        for fila in matriz:
            fila_actual.append(fila[counter])
        res.append(fila_actual)
        fila_actual = []
        counter += 1
    return res


def multiplicar_termino_a_termino(l1, l2):
    resultado = 0
    for i in range(len(l1)):
        resultado += l1[i] * l2[i]
    return resultado


def multiplicar_matriz_auxiliar(m1, m2):
    resultado = []
    for fila in m1:
        fila_actual = []
        for columna in m2:
            fila_actual.append(multiplicar_termino_a_termino(fila, columna))
        resultado.append(fila_actual)
        fila_actual = []
    return resultado


def multiplicar_matriz(m1, m2):
    return multiplicar_matriz_auxiliar(m1, invertir_matriz(m2))


# print(multiplicar_matriz([[11, 3], [7, 11]], [[11, 3], [7, 11]]))
# multiplicar_matriz([[1, 2], [3, 4]], [[4, 3], [2, 1]])


def elevar_matriz(d, p):
    m = np.random.random(size=(d, d))
    resultado = [[m]]
    if p == 1:
        return m
    else:
        for i in range(p):
            resultado[0] = multiplicar_matriz(resultado[0], m)
    return resultado[0]
