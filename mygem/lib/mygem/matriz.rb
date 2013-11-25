# = matriz.rb
#
# Autor:: Jose Luis Gonzalez Hernandez y Karen Mercedes Curro Diaz
# 
# == Clase Madre Matriz
#
# Creamos la clase matriz para que luego crear las clases:
#   - Densas
#   - Dispersas
# 
# Deficicion de la clase _Matriz_ compuesta por
#
# * metodo initialize
# * metodo Matriz.tipo
# * metodo -(other)
# * metodo *(other)
# * metodo +(other)
# * metodo to_s
# * metodo max
# * metodo min
#


class Matriz
  include Comparable
  include Enumerable
  attr_reader :filas, :columnas, :matriz
  
  def initialize(m)
    @filas = m.size
    @columnas = m[0].size
    @matriz = m;
  end

  def Matriz.tipo(m)
    @filas = m.size
    @columnas = m[0].size
    @matriz = m;

    contador = 0;
    
    for i in 0...@filas do
      for j in 0...@columnas do
        if (@matriz[i][j] == 0)
          contador += 1
        end
      end
    end

    if (((contador*100)/(@filas*@columnas)) >= 60)
      MatrizDispersa.new(m)
    else
      MatrizDensa.new(m)
    end
  end
  
  def +(other)#con metodo times
    raise TypeError, 'No se pueden sumar Matrices de distintas dimensiones' unless (@filas==other.filas && @columnas == other.columnas)

    valor = Array.new
    @filas.times do |i|
    #for i in 0...@filas
      valor[i] = Array.new
       @columnas.times do |j|
       #for j in 0...@columnas
        valor[i][j] = (self[i,j] + other[i,j])
      end
    end

   Matriz.tipo(valor)
  end

  def -(other)
    raise TypeError, 'No se pueden restar Matrices de distintas dimensiones' unless (@filas==other.filas && @columnas == other.columnas)

    valor = Array.new

    for i in 0...@filas
      valor[i] = Array.new

      for j in 0...@columnas
        valor[i][j] = (self[i,j] - other[i,j])
      end
    end

   Matriz.tipo(valor)
  end

  def *(other)
    raise TypeError, 'No se pueden Multiplicar' unless (@columnas==other.filas)

    valor = Array.new
    @filas.times do |i|
    #for i in 0...@filas
      valor[i] = Array.new
      @columnas.times do |j|
      #for j in 0...other.columnas
        valor[i][j] = 0
        @columnas.times do |k|
        #for k in 0...@columnas
          valor[i][j] += (self[i,k] * other[k,j])
        end
      end
    end
    
   Matriz.tipo(valor)
  end

  def to_s
    aux = "["
    for i in 0...@filas do
      aux << "["
      for j in 0...@columnas do
        if (j == @columnas-1)
          aux << "#{matriz[i][j]}"
        else
          aux << "#{matriz[i][j]}, "
        end
      end
      aux << "]"
    end
    aux << "]"
  end

  def max
    comparador = 0

    for i in 0...@filas
      for j in 0...@columnas
        if (@matriz[i][j] > comparador)
          comparador = matriz[i][j]
        end
      end
    end

    return comparador
  end

  def min
    comparador = @matriz[0][0]

    for i in 0...@filas
      for j in 0...@columnas
        if (@matriz[i][j] < comparador)
          comparador = matriz[i][j]
        end
      end
    end

    return comparador
  end
end
