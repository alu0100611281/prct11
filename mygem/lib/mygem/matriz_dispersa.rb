# = matriz_dispersa.rb
#
# Autor:: Jose Luis Gonzalez Hernandez y Karen Mercedes Curro Diaz
# 
# == Clase Hija Matriz Dispersa
#
# 
# Deficicion de la clase _MatrizDispersa_ compuesta por
#
# * metodo initialize
# * metodo new_initialize
# * metodo self.copy
# * metodo get
# * metodo set
# * metodo num_nulos
# * metodo to_s
# * metodo -(other)
# * metodo *(other)
# * metodo +(other)
#

require "./lib/mygem/matriz.rb"
require "./lib/mygem/matriz_densa.rb"

module Mygem
  class Matriz_Dispersa < Matriz

    def new_initialize
      @pos = Array.new(@filas)
      @filas.times do |i|
        @pos[i] = {}
      end
    end

    def initialize(filas, columnas)
      super
      new_initialize
    end


  # Metodo Creacion de la matriz dispersa
    def self.copy(matriz)

    obj = new(matriz.filas, matriz.columnas)

    matriz.filas.times do |i|
      matriz.columnas.times do |j|
        val = matriz.get(i,j)
        if(val != 0)
          obj.pos[i][j] = val
        end
      end
    end
    obj
    end

 # Get (Devuelve el valor del elemento guardado en i,j)
    def get(i, j)
      if(@pos[i][j] != nil)
        return @pos[i][j]
      else
        return 0
      end
    end
 # Set (Modifica el valor del elemento guardado en i,j)

    def set(i, j, val)
      if(val == nil or val == 0)
        @pos[i].delete(j)
      else
        @pos[i][j] = val
      end
    end

# Porcentaje de numeros nulos

     def num_nulos
       t = @filas*@columnas
       nn = 0
         
       @filas.times do |i|
         nn += @pos[i].size
         i += 1
       end

       n = t - nn
       n.to_f/t.to_f
     end

#Definicion del metodo to_s

def to_s
      output = ""
      @filas.times do |i|
        output += "Fila #{i}: "
        @pos[i].sort.each{|k, v| output += "#{k}=>#{v} "}
        output += "\n"
      end
      output
    end

#Metodo Suma

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

      if(c.num_nulos > 0.6)
        c = Matriz_Dispersa.copy(c)
      end
      c
    end

#Metodo Resta

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

      if(c.num_nulos > 0.6)
        c = Matriz_Dispersa.copy(c)
      end
      c
    end

#Metodo Multiplicacion

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

    if(c.num_nulos > 0.6)
      c = Matriz_Dispersa.copy(c)
    end
    c
    end
 
 end
end


