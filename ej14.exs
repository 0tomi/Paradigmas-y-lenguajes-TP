# 14. Escriba una función que tome una lista y un elemento como argumentos,
# y devuelva la lista original con todas las
# ocurrencias de dicho elemento eliminadas.


defmodule Ej14 do
    def eliminarOcurrencias(lista, elemento) do
       cond do
        lista == [] -> lista
        hd(lista) == elemento ->
            eliminarOcurrencias(tl(lista), elemento)
        hd(lista) != elemento ->
             [hd(lista) | eliminarOcurrencias(tl(lista), elemento)]
       end
    end
end
IO.inspect(Ej14.eliminarOcurrencias([1,2,3,4,5], 3))

# 35. Considere que cada conjunto se representa mediante una lista.
#     Defina funciones para simular:
#       a. Unión de conjuntos.
#       b. Intersección de conjuntos.
#       c. Diferencia de conjuntos.
#       d. Diferencia simétrica de conjuntos.

# 39. Escriba una función llamada "Cantidad-de" que toma como
#     argumentos una lista y una condición (función), y
#     devuelve la cantidad de elementos de la lista que
#     cumplen con dicha condición.


# 48. Escriba una función que tome una lista y devuelva una lista
#     de pares (número frecuencia), ordenados de mayor a
#     menor de acuerdo a esta última.
#     La frecuencia correspondiente a cada número es la cantidad de
#     veces que el número aparece en la lista.
