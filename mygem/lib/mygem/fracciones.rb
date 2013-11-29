# Implementar en este fichero la clase para crear objetos racionales

require "./lib/mygem/gcd.rb"

module Mygem
  class Fraccion
    # Módulos usados
    include Comparable

    # Métodos principales
      def initialize(x,y)
          @num, @den = x, y
          reducir
      end

      def to_s
          "#{@num}/#{@den}"
      end

end
end

