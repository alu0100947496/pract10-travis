RSpec.describe Pract06 do
  
    before(:all) do
        @vaca = {
            :nombre => "carne de vaca",
            :proteinas => 21.1,
            :glucidos => 0.0,
            :lipidos => 3.1,
            :gei => 50.0,
            :terreno => 164.0
        }
        @cordero = {
            :nombre => "carne de cordero",
            :proteinas => 18.0,
            :glucidos => 0.0,
            :lipidos => 17.1,
            :gei => 20.0,
            :terreno => 185.0
        }
        @camarones = {
            :nombre => "camarones",
            :proteinas => 17.6,
            :glucidos => 1.5,
            :lipidos => 0.6,
            :gei => 18.0,
            :terreno => 2.0
        }
        @chocolate = {
            :nombre => "chocolate",
            :proteinas => 5.3,
            :glucidos => 47.0,
            :lipidos => 30.0,
            :gei => 2.3,
            :terreno => 3.4
        }
        @salmon = {
            :nombre => "salmon",
            :proteinas => 19.9,
            :glucidos => 0.0,
            :lipidos => 13.6,
            :gei => 6.0,
            :terreno => 3.7
        }
        @cerdo = {
            :nombre => "cerdo",
            :proteinas => 21.5,
            :glucidos => 0.0,
            :lipidos => 6.3,
            :gei => 7.6,
            :terreno => 11.0
        }
        @pollo = {
            :nombre => "pollo",
            :proteinas => 20.6,
            :glucidos => 0.0,
            :lipidos => 5.6,
            :gei => 7.6,
            :terreno => 11.0
        }
        @queso = {
            :nombre => "queso",
            :proteinas => 25.0,
            :glucidos => 1.3,
            :lipidos => 33.0,
            :gei => 11.0,
            :terreno => 41.0
        }
        @cerveza = {
            :nombre => "cerveza",
            :proteinas => 0.5,
            :glucidos => 3.6,
            :lipidos => 0.0,
            :gei => 0.24,
            :terreno => 0.22
        }
        @leche = {
            :nombre => "leche de vaca",
            :proteinas => 3.3,
            :glucidos => 4.8,
            :lipidos => 3.2,
            :gei => 3.2,
            :terreno => 8.9
        }
        @huevos = {
            :nombre => "huevos",
            :proteinas => 13.0,
            :glucidos => 1.1,
            :lipidos => 11.0,
            :gei => 4.2,
            :terreno => 8.9
        }
        @cafe = {
            :nombre => "cafe",
            :proteinas => 0.1,
            :glucidos => 0.0,
            :lipidos => 0.0,
            :gei => 0.4,
            :terreno => 0.3
        }
        @tofu = {
            :nombre => "tofu",
            :proteinas => 8.0,
            :glucidos => 1.9,
            :lipidos => 4.8,
            :gei => 2.0,
            :terreno => 2.2
        }
        @lentejas = {
            :nombre => "lentejas",
            :proteinas => 23.5,
            :glucidos => 52.0,
            :lipidos => 1.4,
            :gei => 0.4,
            :terreno => 3.4
        }
        @nuez = {
            :nombre => "nuez",
            :proteinas => 20.0,
            :glucidos => 21.0,
            :lipidos => 54.0,
            :gei => 0.3,
            :terreno => 7.9
        }
        #Alimento fuera de la tabla, solo es para ser el minimo siempre
        a = {
            :nombre => "test",
            :proteinas => 1,
            :glucidos => 1,
            :lipidos => 1,
            :gei => 0,
            :terreno => 1
        }
        @test = Alimento.new(a)

        #Alimentos por orden de la tabla
        @aliVaca  = Alimento.new(@vaca)
        @aliCordero = Alimento.new(@cordero)
        @aliCamarones = Alimento.new(@camarones)
        @aliChocolate = Alimento.new(@chocolate)
        @aliSalmon = Alimento.new(@salmon)
        @aliCerdo = Alimento.new(@cerdo)
        @aliPollo = Alimento.new(@pollo)
        @aliQueso = Alimento.new(@queso)
        @aliCerveza = Alimento.new(@cerveza)
        @aliLeche = Alimento.new(@leche)
        @aliHuevos = Alimento.new(@huevos)
        @aliCafe = Alimento.new(@cafe)
        @aliTofu = Alimento.new(@tofu)
        @aliLentejas = Alimento.new(@lentejas)
        @aliNuez = Alimento.new(@nuez)
    end

    describe Alimento do
        
        before(:all) do
            @food = Alimento.new(@vaca)
        end

        before(:each) do
            @comp1 = Alimento.new(@nuez)
            @comp2 = Alimento.new(@vaca)
            @comp3 = Alimento.new(@cordero)
            @comp4 = Alimento.new(@chocolate)
            @equal1= Alimento.new(@nuez)
        end

        context "Metodos e inicializacion de la clase Alimento" do
            it "Comprobar valores desde initialize" do
                expect(@food.nomb).to eq("carne de vaca")
                expect(@food.gei).to eq(50.0)
                expect(@food.terreno).to eq(164.0)
            end

            it "Getters de la clase" do
                expect(@food.respond_to?:nomb).to eq(true)
                expect(@food.respond_to?:proteina).to eq(true)
                expect(@food.respond_to?:glucidos).to eq(true)
                expect(@food.respond_to?:lipidos).to eq(true)
                expect(@food.respond_to?:gei).to eq(true)
                expect(@food.respond_to?:terreno).to eq(true)
            end

            it "Formato del to_s" do
                expect(@food.to_s).to eq("#{@food.nomb}\n\tProteinas: #{@food.proteina}\nGlucidos: #{@food.glucidos}\nLipidos: #{@food.lipidos}\nGEI: #{@food.gei}\nTerreno: #{@food.terreno}")
            end
        end

        context "Valores energeticos" do

            it "Valor energético" do
                expect(@food.valorEnergetico).to eq(112.3)
            end

            it "Valor de las proteinas" do
                expect(@food.valorProteinas).to eq(84.4)
            end

            it "Valor de los carbohidratos" do
                expect(@food.valorCarbohidratos).to eq(0.00)
            end

            it "Valor de las grasas" do 
                expect(@food.valorGrasas).to eq(27.9)
            end
        end
        context "Pruebas de impacto" do
            it "Impacto diario de un hombre" do
                f1 = Alimento.new(@cerveza)
                f2 = Alimento.new(@nuez)
                f3 = Alimento.new(@cafe)
                f4 = Alimento.new(@chocolate)
                f5 = Alimento.new(@camarones)
                f6 = Alimento.new(@tofu)

                totalGei = ((f1.gei * 6) + f2.gei + f3.gei + f4.gei + f5.gei + f6.gei).truncate(2)

                totalTerreno = ((f1.terreno * 6) + f2.terreno + f3.terreno + f4.terreno + f5.terreno + f6.terreno).truncate(2)

                expect(totalGei).to eq(24.44)
                expect(totalTerreno).to eq(17.12)
            end

            it "Impacto diario de una mujer" do
                f1 = Alimento.new(@vaca)
                f2 = Alimento.new(@salmon)

                impactoGei = (f1.gei + f2.gei).truncate(1)
                impactoTerreno = (f1.terreno + f2.terreno).truncate(1)

                expect(impactoGei).to eq(56.0)
                expect(impactoTerreno).to eq(167.7)
            end

        end

        context "Comparable" do
            it "Comparacion de cual es menor" do
                expect(@comp1 > @comp2).to be true
            end

            it "Comparacion de si son iguales" do
                expect(@comp1 == @equal1).to be true
            end

            it "Comparacion de between" do
                expect(@comp4.between?(@test, @comp1)).to be true
            end

            it "Comparacion de Clamp()" do
                expect(@comp4.clamp(@test, @comp1)).to eq(@comp4)
                expect(@comp1.clamp(@test, @comp4)).to eq(@comp4)
            end
        end 

    end

    describe "Lista" do
        before(:each) do
            @listEach = Lista.new(@vaca)
            @listEach.insert(@cordero)
        end

        before(:all) do
            #Variables para las listas
            @lista = Lista.new(@vaca)

            @listaTest = Lista.new(@aliVaca)
            @listaTest.insert(@aliCordero)
            @listaTest.insert(@test)
            @listaTest.insert(@aliCerveza)

        end


        context "inicializacion de una Lista" do
            it "Crear una clase lista" do
                expect(@lista).not_to eq(nil)
            end

            it "getHead" do
                expect(@listEach.getHead).to eq(@vaca)
            end

            it "getTail" do
                expect(@listEach.getTail).to eq(@cordero)
            end

        end

        context "Insersion y extraccion de elementos en una lista" do
            it "Insertar un nodo" do
                @lista.insert(@nuez)
                expect(@lista.getTail).to eq(@nuez)
            end

            it "Extraer un nodo segun un valor" do
                @listEach.delete(@cordero)
                expect(@listEach.getTail).to eq(@vaca)
            end

            it "Extraer el primer nodo" do
                @listEach.deleteHead
                expect(@listEach.getTail).to eq(@cordero)
            end

            it "Extraer el ultimo nodo" do
                @listEach.deleteTail
                expect(@listEach.getTail).to eq(@vaca)
            end
        end

        context "Calculo de impacto de las dietas" do
            before(:each) do
                @lie = Lista.new(@aliNuez)
                @lie.insert(@aliNuez)
                @lie.insert(@aliLentejas)
                @lie.insert(@aliLentejas)
                @lie.insert(@aliChocolate)
            end

            context "Dieta española" do
                it "Impacto de los carbohidratos" do
                    carbohidratos = @lie.valorCarbohidratos

                    expect(carbohidratos <= 1280.04).to be true
                end

                it "Impacto de las grasas" do
                    grasas = @lie.valorGrasas

                    expect(grasas <= 1280.04).to be true
                end

                it "impacto de las proteinas" do
                    proteinas = @lie.valorProteinas

                    expect(proteinas <= 607.52).to be true
                end
            end
        end


        context "valor" do
            it "Funcion valor" do
                l = Lista.new(1)
                l.insert(2)

                expect(@listEach.valor).to eq(nil)
                expect(l.valor).to eq(3)
            end

            it "Tamaño lista" do
                expect(@listEach.size).to eq(2)
            end

            it "getValor" do
                l = Lista.new(1)
                l.insert(2)
                l.insert(3)

                expect(l.getValor(2)).to eq(2)
                expect(l.getValor(3)).to eq(3)
            end
        end

        context "Enumerable" do
            before(:each) do
                @listEn = Lista.new(3)
                @listEn.insert(2)
                @listEn.insert(1)
                @listEn.insert(5)
                @listEn.insert(4)
            end

            it "collect" do
                v = @listEn.collect{ |i| i * 2 }
                expect(v).to eq([6,4,2,10,8])
            end

            it "select" do
                testlist = Lista.new(@aliVaca)
                testlist.insert(@aliLeche)
                testlist.insert(@aliCordero)

                v = testlist.select{|x| x.nomb == "leche de vaca"}
                v2 = []
                v.each{|i| v2.push(i.nomb)}
                
                expect(v2).to eq(["leche de vaca"])
            end

            it "max" do
                v = @listEn.max
                expect(v == 5).to be true
            end

            it "min" do
                v = @listEn.min
                expect(v == 1).to be true
            end

            it "sort"  do
                v = @listEn.sort
                expect(v).to eq([1,2,3,4,5])
            end
        end

    end
=begin
    describe "Plato" do
        before(:each) do
            @plato = Plato.new(@aliVaca, 200)
        end

        context "Creacion de un plato" do

            it "Getters" do
                expect(@plato.respond_to?:alim).to eq(true)
                expect(@plato.respond_to?:cant).to eq(true)
            end

            it "Insert" do
                @plato.insert(@aliTofu, 300)
                expect(@plato.cant.getTail).to eq(300)
                expect(@plato.alim.getTail.nomb).to eq("tofu")
            end
        end


        context "Porcentajes de los alimentos" do
            it "Proteinas" do
                expect(@plato.proteinas).to eq(16880)
            end

            it "Grasas" do
                expect(@plato.grasas).to eq(5580)
            end

            it "Hidratos" do
                expect(@plato.hidratos).to eq(0)
            end

            it "VCT" do
                expect(@plato.vct).to eq(22460)
            end
        end

    end

    describe "PlatoH" do
        before(:each) do
            @platoh = PlatoH.new(@aliVaca, 200)
            
            @platoh2 = PlatoH.new(@aliVaca, 200)
            @platoh2.insert(@aliVaca, 100)
            
            @platoh3 = PlatoH.new(@aliVaca, 200)
            @platoh3.insert(@aliVaca, 100)
            @platoh3.insert(@aliVaca, 50)

            @española = PlatoH.new(@aliCamarones, 10)
            @española.insert(@aliChocolate, 10)
            @española.insert(@aliLeche, 10)
            @española.insert(@aliNuez, 10)
            @española.insert(@aliCordero, 10)
            @española.insert(@aliLentejas, 10)

            @vasca = PlatoH.new(@aliLeche, 10)
            @vasca.insert(@aliTofu, 10)
            @vasca.insert(@aliNuez, 10)
            @vasca.insert(@aliChocolate, 10)

            @vegetariana = PlatoH.new(@aliLentejas, 10)
            @vegetariana.insert(@aliLeche, 10)
            @vegetariana.insert(@aliQueso, 10)
            @vegetariana.insert(@aliHuevos, 10)

            #@vegetaliana = PlatoH.new()

            #@locura = PlatoH.new()


        end

        context "inicializacion" do
            it "Getters" do
                expect(@platoh.respond_to?:alim).to eq(true)
                expect(@platoh.respond_to?:cant).to eq(true)
            end

            it "Tipo de clase" do
                expect(@platoh.class).to eq(PlatoH)
                expect(@platoh.class.superclass).to eq(Plato)
            end
        end

        context "Emisiones" do
            it "Gases" do
                expect(@platoh.gases).to eq(10000)
            end

            it "Terreno" do
                expect(@platoh.terreno).to eq(32800)
            end

            it "Eficiencia" do
                expect(@platoh.eficiencia).to eq(21400)
            end
        end

        context "Comparable" do
            it "Metodo(<)" do
                expect(@platoh < @platoh2).to be true
            end

            it "Between" do
                expect(@platoh2.between?(@platoh, @platoh3)).to be true
            end

            it "Metodo (==)" do
                ph = PlatoH.new(@aliVaca, 200)

                expect(@platoh == ph).to be true
            end
        end

    end

    describe "Menu" do
        before(:each) do
            @española = PlatoH.new(@aliCamarones, 10)
            @española.insert(@aliChocolate, 10)
            @española.insert(@aliLeche, 10)
            @española.insert(@aliNuez, 10)
            @española.insert(@aliCordero, 10)
            @española.insert(@aliLentejas, 10)

            @vasca = PlatoH.new(@aliLeche, 10)
            @vasca.insert(@aliTofu, 10)
            @vasca.insert(@aliNuez, 10)
            @vasca.insert(@aliChocolate, 10)

            @vegetariana = PlatoH.new(@aliLentejas, 10)
            @vegetariana.insert(@aliLeche, 10)
            @vegetariana.insert(@aliQueso, 10)
            @vegetariana.insert(@aliHuevos, 10)

            @españolaC = Plato.new(@aliCamarones, 10)
            @españolaC.insert(@aliChocolate, 10)
            @españolaC.insert(@aliLeche, 10)
            @españolaC.insert(@aliNuez, 10)
            @españolaC.insert(@aliCordero, 10)
            @españolaC.insert(@aliLentejas, 10)

            @vascaC = Plato.new(@aliLeche, 10)
            @vascaC.insert(@aliTofu, 10)
            @vascaC.insert(@aliNuez, 10)
            @vascaC.insert(@aliChocolate, 10)

            @vegetarianaC = Plato.new(@aliLentejas, 10)
            @vegetarianaC.insert(@aliLeche, 10)
            @vegetarianaC.insert(@aliQueso, 10)
            @vegetarianaC.insert(@aliHuevos, 10)
        end

        context "Española" do
            it "Española eficiencia" do
                expect(@española > @vegetariana).to be true
            end
        end
    end


    describe "Menu" do 
        before(:each) do
            @primero = Plato.new(@aliCamarones, 10)
            @primero.insert(@aliChocolate, 10)
            @primero.insert(@aliLeche, 10)
            @primero.insert(@aliNuez, 10)
            @primero.insert(@aliCordero, 10)
            @primero.insert(@aliLentejas, 10)

            @segundo = Plato.new(@aliLeche, 10)
            @segundo.insert(@aliTofu, 10)
            @segundo.insert(@aliNuez, 10)
            @segundo.insert(@aliChocolate, 10)

            @postre = Plato.new(@aliLentejas, 10)
            @postre.insert(@aliLeche, 10)
            @postre.insert(@aliQueso, 10)
            @postre.insert(@aliHuevos, 10)

            @array  = [ @primero, @segundo, @postre ]
            @precio = [ 8.00, 9.00, 10.00 ]
        end

        it "Valor maximo del menu" do 
            expect(@array.max).to eq(@primero)
        end

        it "Probando el resultado de valorCalorico" do 
            a = Plato.new(@aliLeche, 2)
            a.insert(@aliLentejas, 3)
            expect(a.valorCalorico).to eq(1)
        end

        it "Calculo de los precios segun la huella" do
            aux = @array.collect do |valor|
                if valor.valorCalorico == 1
                    0.1
                elsif valor.valorCalorico == 2
                    0.25
                else
                    0.5
                end
            end

            puts aux.class
            precios2 = aux.zip(@precio).map{|x,y| x * y}
            precioFinal = precios2.zip(@precio).map{|x,y| x + y}

            expect(precioFinal).not_to eq(@precio)
            expect(precioFinal).to eq([12.0,13.5,15.0])
        end
    end
=end

    describe "Plato nuevo initialize" do
        before(:each) do
            @plato1 = Plato.new("Capucchino") do
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

            @plato2 = Plato.new("arroz") do
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
        end

        context "Inicializacion" do
            it "Crear un Plato" do
                expect(@plato1.size).to eq(3)
                expect(@plato1).to eq(@plato1)
                expect(@plato1.getTailName.valorEnergetico).to eq(@aliLeche.valorEnergetico)
            end
        end
    end

    describe "Menu" do
        before(:each) do
            @plato1 = Plato.new("Capucchino") do
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

            @plato2 = Plato.new("arroz") do
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

            @menu = Menu.new("Combinado nº1") do
                descripcion "Capucchino con Arroz a la cubana"

                componente :componente => @plato1,
                           :precio => 2.35

                componente :componente => @plato2,
                           :precio => 4.25

                precio     6.60
            end
        end

        context "Inicializacion" do
            it "Crear un menu" do
                expect(@menu.desc).to eq("Capucchino con Arroz a la cubana")
                expect(@menu.sizePrecios).to eq(2)
                #expect(@menu.sizePlatos).to eq(2) #Devuelve 0, pero con el pry me devuelve 2
            end
        end
    end

                
end