from queue import LifoQueue as Pila
from queue import Queue as Cola
from random import sample

ejemplo_pila = Pila()
for i in range(10):
    ejemplo_pila.put(i)

# parte 1 archivos

# ejercicio 1


def contarlineas(archivo: str) -> int:
    f = open(archivo, "r")
    cantidad: int = len(f.readlines())
    f.close()
    return cantidad


# print(contarlineas("ejemplo.txt"))


def existePalabra(palabra, archivo):
    f = open(archivo, "r")
    lineas = f.readlines()
    palabras = []
    for linea in lineas:
        palabras = palabras + ((linea.split(" ")))
    for i in range(len(palabras)):
        palabras[i] = palabras[i].replace("\n", "")
    f.close()
    return palabra in palabras


# print(existePalabra("paleolitico","ejemplo.txt"))


def cantidadApariciones(palabra, archivo) -> int:
    f = open(archivo, "r")
    lineas = f.readlines()
    palabras = []
    for linea in lineas:
        palabras = palabras + ((linea.split(" ")))
    for i in range(len(palabras)):
        palabras[i] = palabras[i].replace("\n", "")
    f.close()
    return palabras.count(palabra)


# print(cantidadApariciones("paleolitico","ejemplo.txt"))

# ejercicio 2


def clonarSinComentarios(archivo):
    f = open(archivo, "r")
    lineas = f.readlines()
    lineas_sin_comentarios = []
    for linea in lineas:
        if (linea.replace(" ", "")[0]) != "#":
            lineas_sin_comentarios.append(linea)
    f.close()
    sin_comentarios = open("clon.txt", "w")
    for linea in lineas_sin_comentarios:
        sin_comentarios.write(linea)
    sin_comentarios.close()


# clonarSinComentarios("ejemplo.txt")

# ejercicio 3


def archivo_inverso(archivo):
    f = open(archivo, "r")
    lineas = f.readlines()
    lineas.reverse()
    f.close()
    r = open("reverso.txt", "w")
    for linea in lineas:
        r.write(linea)
    r.close()


# archivo_inverso("ejemplo.txt")


# ejercicio 4
def agregar_frase_final(frase: str, archivo: str):
    f = open(archivo, "r+")
    lineas = f.readlines()
    lineas.append("\n" + frase)
    f.truncate(0)
    f.close()
    s = open(archivo, "w")
    for linea in lineas:
        s.write(linea)
    s.close()


# agregar_frase_final("chdddiiii", "ejemplo.txt")


# ejercicio 5
def agregar_frase_ppio(frase: str, archivo: str):
    f = open(archivo, "r+")
    lineas = f.readlines()
    lineas.insert(0, frase + "\n")
    f.truncate(0)
    f.close()
    s = open(archivo, "w")
    for linea in lineas:
        s.write(linea)
    s.close()


# agregar_frase_ppio("anashe", "ejemplo.txt")


# no entiendo la consigna del ejercicio 6 ???


# ejercicio 7
def promedioEstudiante(lu: str) -> float:
    f = open("archivo.csv", "r")
    lineas: list = f.readlines()
    estudiantes: list[list[str]] = []
    notas_del_estudiante = []
    suma_notas = 0
    for linea in lineas:
        estudiantes.append(linea.split(","))
    for estudiante in estudiantes:
        if estudiante[0] == lu:
            notas_del_estudiante.append(estudiante[3].replace("\n", ""))
    for nota in notas_del_estudiante:
        suma_notas += int(nota)
    return suma_notas / len(notas_del_estudiante)


# print(promedioEstudiante("930/22"))

# parte 2 pilas


def generarNrosAlAzar(n: int, desde: int, hasta: int) -> list[int]:
    res: list[int] = []
    opciones = list(range(desde, hasta + 1))
    i = 0
    while i != n:
        res.append(sample(opciones, 1)[0])
        i += 1
    return res


# print(generarNrosAlAzar(3, 2, 6))


def generarNrosAlAzarConPila(n: int, desde: int, hasta: int) -> list[int]:
    res = Pila()
    opciones = list(range(desde, hasta + 1))
    i = 0
    while i != n:
        res.put(sample(opciones, 1)[0])
        i += 1
    return res


# print(generarNrosAlAzarConPila(3, 2, 6).queue)


def cantidadElementos(pila: Pila):
    cantidad = 0
    while not pila.empty():
        pila.get()
        cantidad += 1
    return cantidad


# print(cantidadElementos(ejemplo_pila))


def buscarElMaximo(p: Pila) -> int:
    maximo = p.get()
    while not p.empty():
        tmp = p.get()
        if tmp > maximo:
            maximo = tmp
    return maximo


# print(buscarElMaximo(ejemplo_pila))


# sumo si encuentro un ( , resto si encuentro un ). si el contador llega a negativo
# significa que use uno que cierra sin abrir antes. Si el contador no termina en 0
# significa que falta cerrar alguno
# capaz hay que chequear algo mas que los parentesis no estoy muy seguro
def estaBienBalanceada(s: str):
    contador = 0
    for caracter in s:
        if contador < 0:
            return False
        if caracter == "(":
            contador += 1
        elif caracter == ")":
            contador -= 1
    return contador == 0


# print(estaBienBalanceada("1 + ( 2 x 3 = ( 2 0 / 5 )))"))


# Parte 3 colas
ejemplo_cola = Cola()
for i in range(15):
    ejemplo_cola.put(i)


def generarNrosAlAzarCola(n: int, desde: int, hasta: int):
    c = Cola()
    numeros = generarNrosAlAzar(n, desde, hasta)
    for numero in numeros:
        c.put(numero)
    return c.queue


# print(generarNrosAlAzarCola(3, 4, 10))


def cantidadElementosCola(cola: Cola):
    res = 0
    while not cola.empty():
        cola.get()
        res += 1
    return res


def buscarElMaximoCola(cola: Cola) -> int:
    res: int = cola.get()
    while not cola.empty():
        tmp: int = cola.get()
        if tmp > res:
            res = tmp
    return res


# print(buscarElMaximoCola(ejemplo_cola))


# ejercicio 16
def armarSecuenciaDeBingo() -> Cola[int]:
    cola = Cola()
    secuencia = sample(list(range(100)), 100)
    for n in secuencia:
        cola.put(n)
    return cola


# no termino de entender si esta bien xq siempre da valores  muy altos
# pero creo q es logico
def jugarCartonDeBingo(carton: list[int], bolillero: Cola):
    tiradas = 0
    salio_nro = 0
    print(bolillero.queue)
    while not bolillero.empty():
        tiradas += 1
        tmp = bolillero.get()
        if tmp in carton:
            salio_nro += 1
            print(tmp)
        if salio_nro == 12:
            return tiradas
    return tiradas


# print(
#     jugarCartonDeBingo(
#         [1, 11, 21, 31, 41, 51, 61, 71, 81, 91, 3, 5], armarSecuenciaDeBingo()
#     )
# )


def nPacientesUrgentes(c: Cola[(int, str, str)]):
    contador = 0
    while not c.empty():
        if c.get()[0] <= 3:
            contador += 1
    return contador


# pacientes = Cola()
# pacientes.put((1, "carlos", "..."))
# pacientes.put((4, "carlos", "..."))
# pacientes.put((3, "carlos", "..."))
# pacientes.put((5, "carlos", "..."))

# print(nPacientesUrgentes(pacientes))

# Parte 4 diccionarios


# ejercicio 18
def getPalabras(archivo):
    f = open(archivo, "r")
    lineas = f.readlines()
    palabras = []
    for linea in lineas:
        palabras_en_linea = linea.split(" ")
        palabras += palabras_en_linea
    for i in range(len(palabras)):
        palabras[i] = palabras[i].replace("\n", "")
    return palabras


def agruparPorLongitud(archivo):
    res = {}
    palabras = getPalabras(archivo)
    for palabra in palabras:
        # chequea si ya hay una key que sea ese largo y si esta aumenta por 1
        if len(palabra) in res:
            res[len(palabra)] += 1
        else:
            res.update({(len(palabra)): 1})
    return res


# agruparPorLongitud("ejemplo.txt")


# ejercicio 19
def diccionario_promedios(archivo):
    f = open(archivo, "r")
    lineas = f.readlines()
    estudiantes = []
    cantidad_de_notas_por_est = {}
    res = {}
    for linea in lineas:
        estudiantes.append(linea.split(","))
    # sumo todas las notas por estudiante en res y cuento cuantas notas tiene cada estudiante
    # en el otro objeto para despues poder promediar
    for estudiante in estudiantes:
        if estudiante[0] in res:
            res[estudiante[0]] += int(estudiante[3].replace("\n", ""))
        else:
            res.update({estudiante[0]: int(estudiante[3].replace("\n", ""))})
        if estudiante[0] in cantidad_de_notas_por_est:
            cantidad_de_notas_por_est[estudiante[0]] += 1
        else:
            cantidad_de_notas_por_est.update({estudiante[0]: 1})
    for i in res:
        res[i] = res[i] / cantidad_de_notas_por_est[i]
    return res


# print(diccionario_promedios("archivo.csv"))


# se podia hacer mas facil, me imagino que hay que hacerlo igual con dict
def laPalabraMasFrecuente(archivo: str) -> str:
    f = open(archivo, "r")
    lineas = f.readlines()
    palabras = []
    palabras_por_repeticion = {}
    maximo = 0
    resultado = ""
    for linea in lineas:
        palabras += linea.split(" ")
    for i in range(len(palabras)):
        palabras[i] = palabras[i].replace("\n", "")

    for palabra in palabras:
        if palabra in palabras_por_repeticion:
            palabras_por_repeticion[palabra] += 1
        else:
            palabras_por_repeticion[palabra] = 1

    for key in palabras_por_repeticion:
        if palabras_por_repeticion[key] > maximo:
            maximo = palabras_por_repeticion[key]
            resultado = key
    return resultado


print(laPalabraMasFrecuente("ejemplo.txt"))
