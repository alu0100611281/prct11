
class MatrizDensa < Matriz
  attr_reader :filas, :columnas, :matriz
  
  def initialize(m)
    super (m)
  end
    
  def ==(other)
    if (@filas != other.filas || @columnas != other.columnas)
      return false
    end
    
    for i in 0...@filas
      
      for j in 0...@columnas
        if (@matriz[i][j] != other[i,j])
          return false
        end
      end
    end
    
    return true
  end
  
  def [](fila, columna)
    @matriz[fila][columna]
  end

  def []=(fila, columna, valor)
    @matriz[fila][columna] = valor
  end
  
  
end
