#x = [3,4,6,4,2,5]
#y = [6,8,9,5,4.5,9.5]

#x= [5,3,7,2,8]
#y= [11,6,10,6,12]

x = [64,59,61.5,79,87.5,92.5,95,113,115,138,142.5,144,145,147.5,144,155.5,165]
y = [1.670,1.339,1.712,1.840,2.3,2.234,2.311,2.377,2.736,2.5,2.5,2.479,2.400,3.124,2.5,4.062,2.854]
#f0
def media(x):
    return sum(x) / len(x)
#f1
def diferencia_cuadrado(x):
    la_media = media(x)
    la_diferencia = 0
    for i in x:
        la_diferencia = la_diferencia + (i - la_media) * (i - la_media)
    return la_diferencia

#f2
def diferencia_xy(x, y):
    mediax = media(x)
    mediay = media(y)
    lista_xy = [(a - mediax) * (b - mediay) for a, b in zip(x, y)]
    sumatoria = sum(lista_xy)
    return sumatoria
    
    

def obtener_b1(x,y):
    diferencia = diferencia_xy(x,y)
    diferencia_cuadrados = diferencia_cuadrado(x)
    return diferencia / diferencia_cuadrados

def obtener_b0(x, y):
    mediay = media(y)
    mediax = media(x)
    b1 = obtener_b1(x,y)
    return mediay  - (b1 * mediax)
    
    
def obtener_ecuacion(x,y):
    b0 = obtener_b0(x,y)    
    b1 = obtener_b1(x,y)
    print(f"el modelo de la ecuación es: {b0} + {b1}X")
