class MatrizDispersa < Matriz
  attr_reader :filas, :columnas, :matriz
  
  def initialize(m)
    super (m)

  @matrix = Array.new
  @x = Array.new
  @y = Array.new
  
    for i in 0...@filas
      for j in 0...@columnas
        if (@matriz[i][j] != 0)
         @matrix << @matriz[i][j]
         @x << i
         @y << j
        end
      end
    end
  end
  
  def [](fila, columna)
    for i in 0...@matrix.length
      if (@x[i] == fila && @y[i] == columna)
        return @matrix[i]
      end
    end
    return 0
  end
  
end
