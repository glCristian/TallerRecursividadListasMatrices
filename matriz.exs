defmodule Matriz do

  def main do
    IO.puts("=== TALLER RECURSIVIDAD - MATRICES ===\n")

    # Matrices de prueba
    matriz_3x3 = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    matriz_2x4 = [
      [1, 2, 3, 4],
      [5, 6, 7, 8]
    ]

    matriz_vacia = []

    matriz_fila_unica = [[1, 2, 3, 4, 5]]

    matriz_columna_unica = [[1], [2], [3], [4]]

    # 1. Prueba sumar_matriz
    IO.puts("1. SUMAR ELEMENTOS DE MATRIZ")
    IO.puts("Matriz 3x3:")
    Enum.each(matriz_3x3, fn fila -> IO.puts("  #{inspect(fila)}") end)
    IO.puts("Suma total: #{sumar_matriz(matriz_3x3)}")
    IO.puts("")

    IO.puts("Matriz 2x4:")
    Enum.each(matriz_2x4, fn fila -> IO.puts("  #{inspect(fila)}") end)
    IO.puts("Suma total: #{sumar_matriz(matriz_2x4)}")
    IO.puts("")

    IO.puts("Matriz vacía:")
    IO.puts("Suma total: #{sumar_matriz(matriz_vacia)}")
    IO.puts("")

    # 2. Prueba transponer
    IO.puts("2. TRANSPOSICIÓN DE MATRICES")
    IO.puts("Matriz original 3x3:")
    Enum.each(matriz_3x3, fn fila -> IO.puts("  #{inspect(fila, charlists: :as_lists)}") end)
    transpuesta_3x3 = transponer(matriz_3x3)
    IO.puts("Matriz transpuesta 3x3:")
    Enum.each(transpuesta_3x3, fn fila -> IO.puts("  #{inspect(fila)}") end)
    IO.puts("")

    IO.puts("Matriz original 2x4:")
    Enum.each(matriz_2x4, fn fila -> IO.puts("  #{inspect(fila)}") end)
    transpuesta_2x4 = transponer(matriz_2x4)
    IO.puts("Matriz transpuesta 4x2:")
    Enum.each(transpuesta_2x4, fn fila -> IO.puts("  #{inspect(fila)}") end)
    IO.puts("")

    IO.puts("Fila única:")
    Enum.each(matriz_fila_unica, fn fila -> IO.puts("  #{inspect(fila)}") end)
    transpuesta_fila = transponer(matriz_fila_unica)
    IO.puts("Transpuesta (columna única):")
    Enum.each(transpuesta_fila, fn fila -> IO.puts("  #{inspect(fila)}") end)
    IO.puts("")

    IO.puts("Columna única:")
    Enum.each(matriz_columna_unica, fn fila -> IO.puts("  #{inspect(fila)}") end)
    transpuesta_columna = transponer(matriz_columna_unica)
    IO.puts("Transpuesta (fila única):")
    Enum.each(transpuesta_columna, fn fila -> IO.puts("  #{inspect(fila)}") end)
    IO.puts("")

    IO.puts("Matriz vacía transpuesta: #{inspect(transponer(matriz_vacia))}")
    IO.puts("")

    IO.puts("=== FIN DE PRUEBAS ===")
  end



  #Sumar todos los elementos de una matriz (lista de listas)

  def sumar_matriz([]), do: 0

  def sumar_matriz([fila | resto_filas]) do
    sumar_lista(fila) + sumar_matriz(resto_filas)
  end

  defp sumar_lista([]), do: 0

  defp sumar_lista([cabeza | cola]) do
    cabeza + sumar_lista(cola)
  end



  #Transposición de una matriz

  def transponer([]), do: []
  def transponer([[] | _]), do: []

  def transponer(matriz) do
    primera_columna = Enum.map(matriz, &hd/1)

    resto_columnas = Enum.map(matriz, &tl/1)

    [primera_columna | transponer(resto_columnas)]
  end


end

Matriz.main()
