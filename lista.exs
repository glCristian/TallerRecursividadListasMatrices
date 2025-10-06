defmodule Lista do

  def main do
    IO.puts("=== TALLER RECURSIVIDAD - LISTAS ===\n")

    # Listas de prueba
    lista_numeros = [1, 2, 3, 4, 5, 6, 7, 8]
    lista_mixta = [1, 3, 5, 7, 9]
    lista_vacia = []

    # 1. Prueba contar_pares
    IO.puts("1. CONTAR ELEMENTOS PARES")
    IO.puts("Lista: #{inspect(lista_numeros)}")
    IO.puts("Pares encontrados: #{contar_pares(lista_numeros)}")

    IO.puts("Lista: #{inspect(lista_mixta)}")
    IO.puts("Pares encontrados: #{contar_pares(lista_mixta)}")

    IO.puts("Lista vacía: #{contar_pares(lista_vacia)}")
    IO.puts("")

    # 2. Prueba invertir
    IO.puts("2. INVERTIR LISTA")
    IO.puts("Original: #{inspect(lista_numeros)}")
    IO.puts("Invertida: #{inspect(invertir(lista_numeros))}")

    IO.puts("Original: #{inspect(lista_mixta)}")
    IO.puts("Invertida: #{inspect(invertir(lista_mixta))}")

    IO.puts("Lista vacía invertida: #{inspect(invertir(lista_vacia))}")
    IO.puts("")

    # 3. Prueba suma_objetivo
    IO.puts("3. SUMA OBJETIVO")
    lista_suma = [1, 3, 5, 7]
    objetivos = [8, 10, 15, 20]

    IO.puts("Lista: #{inspect(lista_suma)}")
    Enum.each(objetivos, fn objetivo ->
      resultado = suma_objetivo(lista_suma, objetivo)
      IO.puts("¿Se puede formar #{objetivo}? #{resultado}")
    end)

    IO.puts("")
    IO.puts("=== FIN DE PRUEBAS ===")
  end



  #Contar los pares en una lista

  def contar_pares([]), do: 0

  def contar_pares([cabeza | cola]) when rem(cabeza, 2) == 0 do
    1 + contar_pares(cola)
  end

  def contar_pares([_cabeza | cola]) do
    contar_pares(cola)
  end



  #Invertir una lista sin usar Enum.reverse

  def invertir(lista), do: invertir_aux(lista, [])

  defp invertir_aux([], acumulador), do: acumulador

  defp invertir_aux([cabeza | cola], acumulador) do
    invertir_aux(cola, [cabeza | acumulador])
  end



  #Resolver suma objetivo con combinaciones de una lista

  def suma_objetivo(_, 0), do: true
  def suma_objetivo([], _objetivo), do: false

  def suma_objetivo([cabeza | cola], objetivo) do
    suma_objetivo(cola, objetivo - cabeza) or suma_objetivo(cola, objetivo)
  end


end

Lista.main()
