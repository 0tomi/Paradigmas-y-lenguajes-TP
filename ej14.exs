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
IO.puts("Ejercicio 14: ")
IO.inspect(Ej14.eliminarOcurrencias([1,2,3,4,5,3,6], 3))

# 35. Considere que cada conjunto se representa mediante una lista.
#     Defina funciones para simular:
#       a. Unión de conjuntos.
#       b. Intersección de conjuntos.
#       c. Diferencia de conjuntos.
#       d. Diferencia simétrica de conjuntos.
# Asumimos por el enunciado, que los conjuntos vendran bien representados, por lo que no habra numeros duplicados en cada lista.
defmodule Ej35 do
    def pertenece?(x, lista) do    # vi que se podia poner el ? y queda lindo para las funciones que devuelven un bool
        cond do
            lista == [] -> false
            hd(lista) == x -> true
            true -> pertenece?(x, tl(lista))
        end
    end

    # por si las dudas implemento esta funcion que sanea listas con duplicados
    def arreglarLista(lista) do
        cond do
            lista == [] -> []
            pertenece?(hd(lista), tl(lista)) -> arreglarLista(tl(lista))
            true -> [hd(lista)|arreglarLista(tl(lista))]
        end
    end

    def union(listaA, listaB) do
        cond do
            listaA == [] -> listaB
            pertenece?(hd(listaA), listaB) -> union(tl(listaA), listaB)
            true -> [hd(listaA)| union(tl(listaA), listaB)]
        end
    end

    def interseccion(listaA, listaB) do
        cond do
          listaA == [] -> []
          not pertenece?(hd(listaA), listaB) -> # not es como la alternativa al ! pero mas lindo
            interseccion(tl(listaA), listaB)
          true -> [hd(listaA)| interseccion(tl(listaA), listaB)];
        end
    end

    # A-B, elementos que estan en A que no esten en B.
    def diferencia(listaA, listaB) do
        cond do
            listaA == [] -> []
            pertenece?(hd(listaA), listaB) -> diferencia(tl(listaA), listaB)
            true -> [hd(listaA)|diferencia(tl(listaA), listaB)]
        end
    end

    def diferenciaSimetrica(listaA, listaB) do
        union(diferencia(listaA, listaB), diferencia(listaB, listaA))
    end
    def diferenciaSimetricaB(listaA, listaB) do
        diferencia(union(listaA, listaB), interseccion(listaA,listaB))
    end
end

IO.puts("Ejercicio 35: ")
a = [1,2,3,4,5]
b = [4,5,6,7,8]

IO.puts("Union: ")
IO.inspect(Ej35.union(a, b))
IO.puts("Interseccion: ")
IO.inspect(Ej35.interseccion(a,b))
IO.puts("Diferencia: ")
IO.inspect(Ej35.diferencia(a,b))
IO.puts("Diferencia Simetrica (Metodo de union de diferencias): ")
IO.inspect(Ej35.interseccion(a,b))
IO.puts("Diferencia Simetrica (Metodo de la diferencia entre la union y la intersecion): ")
IO.inspect(Ej35.interseccion(a,b))

# 39. Escriba una función llamada "Cantidad-de" que toma como
#     argumentos una lista y una condición (función), y
#     devuelve la cantidad de elementos de la lista que
#     cumplen con dicha condición.

defmodule Ej39 do
    def cantidad_de(lista, condicion) do
      contar(lista, condicion, 0)
    end

    def contar(lista, condicion, contador) do
        cond do
        lista == [] -> contador
        condicion.(hd(lista)) ->
            contar(tl(lista), condicion, contador + 1)
        true ->
            contar(tl(lista), condicion, contador)
        end
    end
end

IO.puts("Ejercicio 39: ")
a = ["a", "b", "c", "d", "a", "d", "a", "f"]
condicion = fn(x) -> x == "a" end
IO.puts(Ej39.cantidad_de(a,condicion))

# 48. Escriba una función que tome una lista y devuelva una lista
#     de pares (número frecuencia), ordenados de mayor a
#     menor de acuerdo a esta última.
#     La frecuencia correspondiente a cada número es la cantidad de
#     veces que el número aparece en la lista.

defmodule Ej48 do
    def parFrecuenciaOrdenado(lista) do
        listaPares = parFrecuencia(lista)
        ordenar_por_frecuencia(listaPares)
    end

    def ordenar_por_frecuencia(pares) do
        cond do
            pares == [] -> []
            true ->
                par_actual = hd(pares)
                resto_ordenado = ordenar_por_frecuencia(tl(pares))
                insertar_en_orden(par_actual, resto_ordenado)
        end
    end

    def insertar_en_orden(par, lista) do
        cond do
            lista == [] -> [par]
            tl(par) >= tl(hd(lista)) -> [par | lista]   # la frecuencia esta en el 2do elemento, por eso el tail
            true ->
                cabeza = hd(lista)
                [cabeza | insertar_en_orden(par, tl(lista))]
        end
    end

    def parFrecuencia(lista) do
        cond do
            lista == [] -> []
            true ->
                freq = contarFrecuencia(lista, hd(lista),0)
                elemento = hd(lista)
                newLista = Ej14.eliminarOcurrencias(lista, elemento)
                [[elemento, freq]| parFrecuencia(newLista)]
        end
    end
    def contarFrecuencia(lista, item, contador) do
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
