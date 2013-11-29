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


require './lib/mygem/racional.rb'

module Prct09
  class Matriz
    attr_reader :filas, :columnas
    attr_accessor :pos

    def initialize(filas, columnas)
      @filas=filas
      @columnas=columnas
    end

  end
end

