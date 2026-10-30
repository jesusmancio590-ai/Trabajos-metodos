def calcular_finanzas():
    print("--- CÁLCULO DE GANANCIA Y PUNTO DE EQUILIBRIO ---")
    
    # Entradas (equivalente a los valores de la columna C)
    precio_venta = float(input("Precio de venta por unidad: "))
    costo_fijo = float(input("Costo fijo: "))
    costo_variable = float(input("Costo variable por unidad: "))
    num_unidades = float(input("Número de unidades: "))
    
    # Fórmulas basadas en tus capturas
    # Ganancia = C5 * C8 - (C6 + C7 * C8) ->
    ganancia = (precio_venta * num_unidades) - (costo_fijo + costo_variable * num_unidades)
    
    # Punto de Equilibrio = C6 / (C5 - C7) ->
    if precio_venta - costo_variable == 0:
        punto_equilibrio = "Indefinido (El precio de venta es igual al costo variable)"
    else:
        punto_equilibrio = costo_fijo / (precio_venta - costo_variable)
    
    # Resultados
    print("\n--- RESULTADOS ---")
    print(f"GANANCIA: {ganancia}")
    print(f"PUNTO DE EQUILIBRIO: {punto_equilibrio}")

if __name__ == "__main__":
    calcular_finanzas()
