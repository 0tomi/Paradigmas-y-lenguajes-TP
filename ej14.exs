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
