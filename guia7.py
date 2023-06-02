import math
# ej 1
#1
def raizDe2():
    print(round(math.sqrt(2),2))

#2
def imprimirhola():
    print("hola")

#7
def factorial_5() -> int:
    return 1*2*3*4*5


#ej 2

def saludo(nombre):
    print("hola" + nombre)

def imprimir_dos_veces(estribillo):
    print(estribillo * 2)



def es_multiplo_de(n,m) -> bool:
    if n%m == 0:
        return True
    else:
        return True

def es_par(n) -> bool:
    if n%2 == 0:
        return True
    else:
        return False


def cantidad_de_pizzas(comensales, min_cant_de_porciones) -> int:
    cantidad_porciones = comensales * min_cant_de_porciones
    pizzas_necesarias = cantidad_porciones / 8
    return math.ceil(pizzas_necesarias) # ceil redondea para arriba



def del_uno_al_diez():
    for i in range(10):
        print(i+1)

def del_diez_a_40():
    n = 10
    while n <= 40:
        print(n)
        n +=1


def del_diez_a_40_par():
    n = 10
    while n <= 40:
        print(n)
        n +=2
        
del_diez_a_40_par()

def eco():
    for i in range(10):
        print("eco")

def despegue(n):
    while(n != 0):
        print(n)
        n = n-1
    print("despegue")


despegue(10)