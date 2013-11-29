# = matriz_densa.rb
#
# Autor:: Jose Luis Gonzalez Hernandez y Karen Mercedes Curro Diaz
# 
# == Clase Hija Matriz Densa
#
# Creamos la clase matriz densa para que luego crear las clases:
#   - Densas
#   - Dispersas
# 
# Deficicion de la clase _Matriz_ compuesta por
#
# * metodo initialize
# * metodo get
# * metodo set
# * metodo num_nulos
# * metodo -(other)
# * metodo *(other)
# * metodo +(other)
# * metodo to_s
# * metodo max
# * metodo min
#
#
#

require "./lib/mygem/matriz.rb"


module Mygem

  class Matriz_Densa < Matriz

    # Initialize
    def initialize(filas, columnas)
      super
      @pos = Array.new(@filas,0)
# i = 0
# while i < @filas
        @filas.times do |i|
        @pos[i] = Array.new(@columnas,0)
# i += 1
      end
    end


 # Get (Devuelve el valor del elemento guardado en i,j)
    def get(i, j)
      @pos[i][j]
    end

 # Set (Modifica el valor del elemento guardado en i,j)
    def set(i, j, val)
      @pos[i][j] = val
    end

 # Porcentaje de numeros nulos
    def num_nulos
      total = @filas*@columnas
      nn = 0
        @filas.times do |i|
         @columnas.times do |j|
# i = 0
# while(i < @filas)
# j = 0
# while(j < @columnas)
           if(@pos[i][j] != 0)
             nn += 1
           end
# j += 1
         end
# i += 1
       end

      n = total - nn

      n.to_f/total.to_f
    end

#Definicion del metodo to_s
    def to_s
      s = ""
        @filas.times do |i|
         @columnas.times do |j|

# i = 0
# while(i < @filas)
# j = 0
# while(j < @columnas)
          s += "#{@pos[i][j].to_s} "
# j += 1
        end
        puts " "
# i += 1
      end
      s
    end


 # Metodo Suma
    def +(other)
      c = Matriz_Densa.new(@filas, @columnas)
        @filas.times do |i|
        @columnas.times do |j|

# i = 0
# while(i < @filas)
# j = 0
# while(j < @columnas)
          c.set(i, j, get(i,j) + other.get(i,j))
# j += 1
        end
# i += 1
      end
      c
    end

# Metodo Resta
    def -(other)
      c = Matriz_Densa.new(@filas, @columnas)
        @filas.times do |i|
        @columnas.times do |j|


# i = 0
# while(i < @filas)
# j = 0
# while(j < @columnas)
          c.set(i, j, get(i,j) - other.get(i,j))
# j += 1
        end
# i += 1
      end
      c
    end

# Metodo Multiplicacion
    def *(other)
        c = Matriz_Densa.new(@filas, other.columnas)
        @filas.times do |i|
         other.columnas.times do |j|
                @columnas.times do |k|
# i = 0
# while(i < @filas)
# j = 0
# while(j < other.columnas)
# k = 0
# while(k < @columnas)
              c.set(i, j, get(i, k) * other.get(k,j) + c.get(i,j))
# k += 1
            end
# j += 1
          end
# i += 1
        end
        c
    end


#Metodo Comparacion
#Busqueda del maximo
    def max
        m = get(0,0)
        @filas.times do |i|
         @columnas.times do |j|
# i = 0
# while(i < @filas)
# j = 0
# while(j < @columnas)
                        if (get(i,j) > m)
                                m = get(i,j)
                        end
# j += 1
                end
# i += 1
        end
        m
    end

#Busqueda del minimo
    def min
        m = get(0,0)
        @filas.times do |i|
         @columnas.times do |j|
# i = 0
# while(i < @filas)
# j = 0
# while(j < @columnas)
                        if (get(i,j) < m)
                                m = get(i,j)
                        end
# j += 1
                end
# i += 1
        end
        m
    end
 
 end
end
