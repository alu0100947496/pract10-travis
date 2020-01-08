# Clase PlatoH que hereda de la clase Plato
class PlatoH < Plato
	# Inicialización de la clase. Usa la de la madre(Plato)
	# @param [Alimento] alim Objeto de la clase Alimento.
	# @param [Integer] cant Cantidad en gramos del alimento.
	def initialize(alim, cant)
		super(alim, cant)
	end

	# Método para utilizar Comparable, así la clase sabe que condición tiene que mirar para discriminar.
 	# @param [PlatoH] other Se espera recibir un objeto del mismo tipo que la clase.
	def <=>(other)
		self.eficiencia <=> other.eficiencia
	end
=begin
	def terreno
		sz = @alim.size
		i = 1
		total = 0

		while i <= sz
			total += (@alim.getValor(i).terreno * @cant.getValor(i))
			i += 1
		end

		total
	end


	def gases
		sz = @alim.size
		i = 1
		total = 0

		while i <= sz
			total += (@alim.getValor(i).gei * @cant.getValor(i))
			i += 1
		end

		total
	end

	def eficiencia
		sz = @alim.size
		i = 1
		total = 0

		while i <= sz
			total += (@alim.getValor(i).gei * @cant.getValor(i))
			total += (@alim.getValor(i).terreno * @cant.getValor(i))
			i += 1
		end

		(total/2).truncate(2)
	end

	def each
		current_node = @alim.head

        yield current_node.value

        while current_node.next != nil
            current_node = current_node.next

            yield current_node.value
        end
    end
=end
end
