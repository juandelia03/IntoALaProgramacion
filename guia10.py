#ejercicio 1

def contarlineas(archivo:str) -> int:
    f = open(archivo,"r")
    cantidad:int = len(f.readlines())
    f.close()
    return cantidad

# print(contarlineas("ejemplo.txt"))

def existePalabra(palabra,archivo):
    f = open(archivo,"r")
    lineas = f.readlines()
    palabras = []
    for linea in lineas:
        palabras = palabras + ((linea.split(" ")))
    for i in range(len(palabras)):
        palabras[i] = palabras[i].replace("\n","")
    f.close()
    print(palabras)
    return palabra in palabras
    
# print(existePalabra("paleolitico","ejemplo.txt"))


def cantidadApariciones(palabra,archivo) -> int:
    f = open(archivo,"r")
    lineas = f.readlines()
    palabras = []
    for linea in lineas:
        palabras = palabras + ((linea.split(" ")))
    for i in range(len(palabras)):
        palabras[i] = palabras[i].replace("\n","")
    f.close()
    return (palabras.count(palabra))


# print(cantidadApariciones("paleolitico","ejemplo.txt"))

#ejercicio 2

def clonarSinComentarios(archivo):
    f = open(archivo,"r")
    lineas = (f.readlines())
    lineas_sin_comentarios = []
    for linea in lineas:
        if (linea.replace(" ","")[0]) != "#":
            lineas_sin_comentarios.append(linea)
    f.close()
    sin_comentarios = open("clon.txt","w")
    for linea in lineas_sin_comentarios:
        sin_comentarios.write(linea)
    sin_comentarios.close()
    
# clonarSinComentarios("ejemplo.txt")

#ejercicio 3

def archivo_inverso(archivo):
    f = open(archivo,"r")
    lineas= f.readlines()
    lineas.reverse()
    f.close()
    r = open("reverso.txt","w")
    for linea in lineas:
        r.write(linea)
    r.close()

# archivo_inverso("ejemplo.txt")

#ejercicio 4
def agregar_frase(frase:str,archivo:str):
    f = open(archivo,"r+")
    lineas = f.readlines()
    lineas.append("\n"+frase)
    f.truncate(0)
    f.close()
    s = open(archivo,"w")
    for linea in lineas:
        s.write(linea)
    s.close()
# agregar_frase("chdddiiii","ejemplo.txt")