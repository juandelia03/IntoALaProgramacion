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


def palindroma(palabra):
    inversoPalabra = ""
    for l in palabra:
        inversoPalabra = l + inversoPalabra
    return inversoPalabra == palabra

def tieneNumero(palabra):
    for i in palabra:
        if i.isdigit():
            return True
    return False
    

def calidadContra(contra):
    if len(contra) < 5:
        return "roja"
    elif (len(contra) > 8) and (not (contra.isupper()) and not(contra.islower())) and (tieneNumero(contra)):
        return "verde"
    else:
        return "amarillo"

def banco(l):
    saldo = 0
    for i in l:
        if i[0] == "R":
            saldo -= i[1]
        else:
            saldo += i[1]
    return saldo

def tresVocalesDistintas(palabra):
    vocales = ["a","e","i","o","u"]
    vocales_palabra = []
    for p in palabra:
        if p in vocales and not (p in vocales_palabra):
            vocales_palabra.append(p)
    return  len(vocales_palabra) >= 3



    