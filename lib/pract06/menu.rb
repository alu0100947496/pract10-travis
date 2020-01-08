require 'pry'

class Menu
	attr_reader :nomb, :desc, :total

	def initialize(nomb, &block)
		@nomb = nomb
		@desc = ""
		@platos = []
		@precios = []
		@total = 0

		if block_given?  
	      if block.arity == 1
	        yield self
	      else
	       instance_eval(&block) 
	      end
	    end
	end

	def descripcion(text)
		@desc = text
	end

	def componente(options = {})
		@platos << options[:componente] if options[:componente]
		@precios << options[:precio] if options[:precio]
	end

	def precio(total)
		@total = total
	end

	def sizePrecios
		@precios.size
	end

	def sizePlatos
		@platos.size
	end

	def to_s
		output = @nomb
		output << "\n#{'=' * @nomb.size}\n\n"


		output << "Componentes: "
		output << "\n===========\n"
		@platos.each_with_index do |dumb, index|
			output << "\n\t#{index + 1}) #{dumb.nomb}"
			output << "\n\n\tAlimentos del plato"
			output << "\n\t-------------------"
			for j in dumb.alim do
				output << "\n\t\t#{j.nomb}"
			end
		end

		output << "\n\nRespectivos precios: "
		@precios.each_with_index do |dumb, index|
			output << "\n\t#{index + 1}) #{dumb}"
		end

		output << "\n\nPrecio total: #{@total}"

		total = 0
		sz = 0
		total2 = 0
		sz2 = 0

		output << "\n\nValor Calorico de cada plato"
		for i in @platos do
			output << "\n\t#{i.totalAporte}"
			total += i.totalAporte
			sz += 1
		end

		if sz != 0
			total = (total/sz)
		end
		
		output << "\nIndice total:\t#{total}"

		output << "\n\nImpacto ambiental de cada plato"
		for i in @platos do
			output << "\n\t#{i.impactoCarbono}"
			total2 += i.impactoCarbono
			sz2 += 1
		end

		if sz2 != 0
			total2 = (total2/sz2)
		end
		
		output << "\nIndice total:\t#{total2}"


      	output
   
	end

end

plato1 = Plato.new("Capucchino") do
    nombre  "Cafe Capucchino"
    componente :descripcion => Alimento.new({
                    :nombre => "chocolate",
                    :proteinas => 5.3,
                    :glucidos => 47.0,
                    :lipidos => 30.0,
                    :gei => 2.3,
                    :terreno => 3.4
                }),
               :cantidad => 20

    componente :descripcion => Alimento.new({
                    :nombre => "cafe",
                    :proteinas => 0.1,
                    :glucidos => 0.0,
                    :lipidos => 0.0,
                    :gei => 0.4,
                    :terreno => 0.3
                }),
               :cantidad => 10

    componente :descripcion => Alimento.new({
                    :nombre => "leche de vaca",
                    :proteinas => 3.3,
                    :glucidos => 4.8,
                    :lipidos => 3.2,
                    :gei => 3.2,
                    :terreno => 8.9
                }),
               :cantidad => 15
end

plato2 = Plato.new("arroz") do
    nombre  "Arroz a la cubana"
    componente :descripcion => Alimento.new({
                    :nombre => "lentejas",
                    :proteinas => 23.5,
                    :glucidos => 52.0,
                    :lipidos => 1.4,
                    :gei => 0.4,
                    :terreno => 3.4
                }),
               :cantidad => 20

    componente :descripcion => Alimento.new({
                    :nombre => "cerdo",
                    :proteinas => 21.5,
                    :glucidos => 0.0,
                    :lipidos => 6.3,
                    :gei => 7.6,
                    :terreno => 11.0
                }),
               :cantidad => 30

    componente :descripcion => Alimento.new({
                    :nombre => "huevos",
                    :proteinas => 13.0,
                    :glucidos => 1.1,
                    :lipidos => 11.0,
                    :gei => 4.2,
                    :terreno => 8.9
                }),
               :cantidad => 10
end

menu = Menu.new("Combinado nº1") do
    descripcion "Capucchino con Arroz a la cubana"

    componente :componente => plato1,
               :precio => 2.35

    componente :componente => plato2,
               :precio => 4.25

    precio     6.60
end

#binding.pry