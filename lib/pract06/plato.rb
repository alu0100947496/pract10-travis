require 'pry'

# @author José Ramón Rodríguez Hernández

# Clase Plato, contiene una lista de Alimentos y otra con las cantidades de los mismos.
class Plato
	include Comparable

	attr_reader :alim, :cant, :nomb

	# Inicialización de la clase.
	# @param [Alimento] alim Objeto de la clase Alimento.
	# @param [Integer] cant Cantidad en gramos del alimento.
	def initialize(nomb, &block)
		@nomb = nomb
		#@alim = Lista.new(alim)
		#@cant = Lista.new(cant)
		@alim = Lista.new(0)
		@alim.deleteHead

		@cant = Lista.new(0)
		@cant.deleteHead

		if block_given?
			if block.arity == 1
				yield self
			else
				instance_eval(&block)
			end
		end
	end



	# Método para utilizar Comparable, así la clase sabe que condición tiene que mirar para discriminar.
 	# @param [Plato] other Se espera recibir un objeto del mismo tipo que la clase.
	def <=>(other)
		self.totalAporte <=> other.totalAporte
	end

	# Método para insertar un Alimento y su cantidad en la clase.
	# @param [Alimento] alim Alimento a insertar.
	# @param [Integer] cant Cantidad de Alimento a insertar.
	def insert(alim, cant)
		@alim.insert(alim)
		@cant.insert(cant)
	end

	# Método para calcular el valor calórico total de la lista e iterpretarla según el nivel.
	# @return [Integer] Escala del valor calórico del Plato.
	def valorCalorico
		a = @alim.collect{|valor| valor.valorEnergetico}
		#b = @cant.collect{|valor| valor}
		b = a.reduce(0){|sum, num| sum + num}

		if b < 670
			1
		elsif b < 830
			2
		else
			3
		end
	end

	# Método para calcular el impacto ambiental total de la lista e iterpretarla según el nivel.
	# @return [Integer] Escala del impacto ambiental del Plato.
	def impactoCarbono
		a = @alim.collect{|valor| valor.impacto}
		#b = @cant.collect{|valor| valor}
		b = a.reduce(0){|sum, num| sum + num}
		
		if b < 800
			1
		elsif b < 1200
			2
		else
			3
		end
	end

	# Método para calcular el nivel medio entre el valorCalorico y el impactoCarbono.
	# @return [Integer] Escala media del Plato, redondeada a la baja.
	def totalAporte
		a = impactoCarbono
		b = valorCalorico
		c = ((a+b)/2).truncate(0)
		c
	end

	# Método destinado a convertir la clase en enumerable a cada uno de sus elementos.
	def each
		@alim.map{|x| yield x.value}
	end

	def size
		@alim.size
	end

	def getTailName
		@alim.getTail
	end

	def componente(options = {})
		insert(options[:descripcion], options[:cantidad])
	end

	def nombre(nomb)
		@nomb = nomb
	end


=begin
	def proteinas
		sz = @alim.size
		i = 1
		total = 0

		while i <= sz
			total += (@alim.getValor(i).valorProteinas * @cant.getValor(i))
			i += 1
		end

		total
	end

	def grasas
		sz = @alim.size
		i = 1
		total = 0

		while i <= sz
			total += (@alim.getValor(i).valorGrasas * @cant.getValor(i))
			i += 1
		end

		total
	end

	def hidratos
		sz = @alim.size
		i = 1
		total = 0

		while i <= sz
			total += (@alim.getValor(i).valorCarbohidratos * @cant.getValor(i))
			i += 1
		end

		total
	end

	def vct
		sz = @alim.size
		i = 1
		total = 0

		while i <= sz
			total += (@alim.getValor(i).valorEnergetico * @cant.getValor(i))
			i += 1
		end

		total
	end


	def printPlato
		sz = @alim.size
		i = 1
		print "["

		while i <= sz
			print "\n\t", @alim.getValor(i).nomb, " => ", @cant.getValor(i), "gr."
			i += 1
		end

		print "\n]\n"
	end



	def each
		current_node = @alim.head

        yield current_node.value

        while current_node.next != nil
            current_node = current_node.next

            yield current_node.value
        end
=end
end

=begin
nuez = {
    :nombre => "nuez",
    :proteinas => 20.0,
    :glucidos => 21.0,
    :lipidos => 54.0,
    :gei => 0.3,
    :terreno => 7.9
}
a = Plato.new(Alimento.new(nuez), 10)
a.insert(Alimento.new(nuez), 10)
=end

# Clase Array modificada para añadir el como interpretar la multiplicación.
class Array
	# Método para que sepa como multiplicar dos objetos de tipo Array.
	# @param [Array] other objeto a multiplicar junto con el que se a convocado.
	# @return [Array] Resultado de la multiplicación de ambos.
	def *(other)
		self.zip(other).map{|x,y| x * y}
	end

end
=begin
leche = {
    :nombre => "leche de vaca",
    :proteinas => 3.3,
    :glucidos => 4.8,
    :lipidos => 3.2,
    :gei => 3.2,
    :terreno => 8.9
}
chocolate = {
    :nombre => "chocolate",
    :proteinas => 5.3,
    :glucidos => 47.0,
    :lipidos => 30.0,
    :gei => 2.3,
    :terreno => 3.4
}
cafe = {
    :nombre => "cafe",
    :proteinas => 0.1,
    :glucidos => 0.0,
    :lipidos => 0.0,
    :gei => 0.4,
    :terreno => 0.3
}

aliLeche = Alimento.new(leche)
aliCafe = Alimento.new(cafe)
aliChocolate = Alimento.new(chocolate)


plato1 = Plato.new("Capucchino") do
    nombre  "Cafe Capucchino"
    componente :descripcion => aliChocolate,
               :cantidad => 20
    componente :descripcion => aliCafe,
               :cantidad => 10
    componente :descripcion => aliLeche,
               :cantidad => 15
end


binding.pry
=end