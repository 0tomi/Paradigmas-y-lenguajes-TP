# 48. Escriba una función que tome una lista y devuelva una lista
#     de pares (número frecuencia), ordenados de mayor a
#     menor de acuerdo a esta última.
#     La frecuencia correspondiente a cada número es la cantidad de
#     veces que el número aparece en la lista.

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
IO.puts("Ejercicio 14: ")
IO.inspect(Ej14.eliminarOcurrencias([1,2,3,4,5,3,6], 3))

defmodule Ej48 do
    def parFrecuenciaOrdenado(lista) do
        ordenar_por_frecuencia(parFrecuencia(lista))
    end

    defp ordenar_por_frecuencia(pares) do
        cond do
            pares == [] -> []
            true ->
                insertar_en_orden(hd(pares), ordenar_por_frecuencia(tl(pares)))
        end
    end

    defp insertar_en_orden(par, lista) do
        cond do
            lista == [] -> [par]
            tl(par) >= tl(hd(lista)) -> [par | lista]   # la frecuencia esta en el 2do elemento, por eso el tail
            true ->
                [hd(lista) | insertar_en_orden(par, tl(lista))]
        end
    end

    defp parFrecuencia(lista) do
        cond do
            lista == [] -> []
            true ->
                [[hd(lista), contarFrecuencia(lista, hd(lista),0)]| parFrecuencia(Ej14.eliminarOcurrencias(lista, hd(lista)))]
        end
    end
    defp contarFrecuencia(lista, item, contador) do
        cond do
            lista == [] -> contador
            hd(lista) == item -> contarFrecuencia(tl(lista), item, contador+1)
            true -> contarFrecuencia(tl(lista), item, contador)
        end
    end
end

IO.puts("Ejercicio 48: ")
a = ["a", "b", "c", "d", "a", "d", "a", "f"]

IO.inspect(Ej48.parFrecuenciaOrdenado(a))
