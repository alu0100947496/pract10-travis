 require 'pry'

# @author José Ramón Rodríguez Hernández


# Clase que contiene las propiedades de los alimentos para calcular su Valor calórico e Impacto ambiental
 class Alimento

 	include Comparable

 	# Método encargado de devolver los valores de los atributos de la clase
 	# @return [Integer]
 	attr_reader :nomb, :proteina, :glucidos, :lipidos, :gei, :terreno

 	# Inicialización de la clase
 	# @param [Hash] hash Contiene 6 elementos: nombre, gei, terreno, proteinas,glucidos y lipidos
 	def initialize (hash)
 		@nomb     = hash[:nombre]
 		@gei      = hash[:gei]
 		@terreno  = hash[:terreno]
 		@proteina = hash[:proteinas]
 		@glucidos = hash[:glucidos]
 		@lipidos  = hash[:lipidos]
 	end

 	# Método para utilizar Comparable, así la clase sabe que condición tiene que mirar para discriminar.
 	# @param [Alimento] other Se espera recibir un objeto del mismo tipo que la clase.
 	def <=>(other)
 		self.valorEnergetico <=> other.valorEnergetico
 	end

 	# Método para dar formato texto a la información relevante de la clase de una manera estructurada.
 	# @return [String] Información de la clase.
 	def to_s
		"#{@nomb}\n\tProteinas: #{@proteina}\nGlucidos: #{@glucidos}\nLipidos: #{@lipidos}\nGEI: #{@gei}\nTerreno: #{terreno}" 	
	end

	# Método para sacar el valor calórico del alimento, según sus propiedades.
	# @return [Integer] Valor calórico.
 	def valorEnergetico
		((@proteina * 4) + (@lipidos * 9) + (@glucidos * 4)).truncate(1)
 	end

 	# Método para sacar el valor calórico de las proteínas del alimento.
 	# @return [Integer] Valor calórico de las proteínas.
 	def valorProteinas
 		(@proteina * 4).truncate(2)
 	end

	# Método para sacar el valor calórico de los carbohidratos del alimento.
 	# @return [Integer] Valor calórico de los carbohidratos.
 	def valorCarbohidratos
 		(@glucidos * 4).truncate(2)
 	end

 	# Método para sacar el valor calórico de las grasas del alimento.
 	# @return [Integer] Valor calórico de las grasas.
 	def valorGrasas
 		(@lipidos * 9).truncate(2)
 	end

 	# Método para calcular el impacto ambiental del alimento.
 	# @return [Integer] Impacto ambiental del alimento.
 	def impacto
 		(@terreno + @gei).truncate(2)
 	end
end

#binding.pry