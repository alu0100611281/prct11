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
#
#


require './lib/mygem/fracciones.rb'

module Mygem
  class Matriz
    attr_reader :filas, :columnas
    attr_accessor :pos

    def initialize(filas, columnas)
      @filas=filas
      @columnas=columnas
    end

  end
end

