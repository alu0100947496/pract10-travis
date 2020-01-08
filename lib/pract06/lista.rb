require 'pry'

# @author José Ramón Rodríguez Hernández

# Clase lista doblemente enlazada destinada principalmente a contener Alimentos.
class Lista

    include Enumerable

    # Struct destinado a ser una base con la que trabajar en la lista, llamada Node.
    Node = Struct.new(:prev, :next, :value)


    # Inicialización de la clase
    # @param [Any] valor Puede ser cualquier tipo de Objeto, que lo almacenará individualmente, aunque todos los métodos están pensados en Alimento.
    def initialize(valor)
        node = Node.new(nil,nil,valor)
        @head = node
        @tail = node
    end

=begin
    def <=>(other)
        self.value.valorEnergetico <=> other.value.valorEnergetico
    end
=end

    # Método destinado a convertir la clase en enumerable a cada uno de sus elementos.
    def each
        current_node = @head

        yield current_node.value

        while current_node.next != nil
            current_node = current_node.next

            yield current_node.value
        end
    end

    # Método para insertar elementos en la lista por el final.
    # @param [Any] valor No tiene un tipo de dato establecido, sea el que sea se inserta, aunque todos los métodos están pensados en Alimento.
    def insert(valor)
        nodo = Node.new(nil, nil, valor)

        if @head == nil and @tail == nil
            @tail = nodo
            @head = nodo
        else
            auxNode = @tail
            auxNode.next = nodo
            nodo.prev = auxNode

            @tail = nodo
        end
    end


    # Método para eliminar un elemento de la lista a desear a través del parámetro.
    # @param [Any] valor No hay un tipo de dato establecido, aunque todos los métodos están pensados en Alimento.
    def delete(valor)
        current_node = Node.new(nil,nil,valor)
        node = Node.new(nil,nil,valor)
        current_node.next = @head

        if current_node.value == @head.value
            @head = current_node.next
        else
            while (current_node.next != nil) && (current_node.next.value != node.value)
                current_node = current_node.next
            end
            if current_node.next != nil
                current_node.next = current_node.next.next
                @tail = @tail.prev
            end
        end
    end


    # Método para eliminar el último elemento que se ha insertado.
    def deleteTail
        if @head != @tail
            @tail = @tail.prev
        else
            @head = @tail = nil
        end
    end

    # Método que elimina el primer elemento que se insertó.
    def deleteHead
        if @head != @tail
            @head = @head.next
        else
            @head = @tail = nil
        end
    end

    # Método que obtiene el objeto que se insertó por primera vez.
    # @return [Any] Primer elemento insertado.
    def getHead
        @head.value
    end

    # Método que obtiene el objeto que se insertó por última vez.
    # @return [Any] Último elemento insertado.
    def getTail
        @tail.value
    end

    # Método para calcular los carbohidratos totales de la lista.
    # @return [Integer] Valor calórico total de los carbohidratos de la lista.
    def valorCarbohidratos
        current_node = @head

        valor = current_node.value.valorCarbohidratos

        while current_node.next != nil
            current_node = current_node.next

            valor += current_node.value.valorCarbohidratos
        end

        return valor
    end

    # Método para calcular las grasas totales de la lista.
    # @return [Integer] Valor calórico total de las grasas de la lista.
    def valorGrasas
        current_node = @head

        valor = current_node.value.valorGrasas

        while current_node.next != nil
            current_node = current_node.next

            valor += current_node.value.valorGrasas
        end

        return valor
    end

    # Método para calcular las grasas totales de la lista.
    # @return [Integer] Valor calórico total de las grasas de la lista.
    def valorProteinas
        current_node = @head

        valor = current_node.value.valorProteinas

        while current_node.next != nil
            current_node = current_node.next

            valor += current_node.value.valorProteinas
        end

        return valor
    end

    # Método para calcular el número total contenido en la lista, destinada solo a cuando se guardan Integer.
    # @return [Integer] Suma de los elementos.
    # @return [nil] Cuando se llama sin contener Integer, devuelve un nil.
    def valor
        current_node = @head

        if current_node.value.class == Integer
            valor = current_node.value

            while current_node.next != nil
                current_node = current_node.next

                valor += current_node.value
            end

            return valor
        else
            return nil
        end
    end


    # Método destinado a obtener un elemento de la lista según un número de 1 a N, tamaño máximo de la lista.
    # @param [Integer] n Posición de la lista a escoger.
    # @return [Any] Depende de que hayan insertado.
    def getValor(n)
        if n == 1
            @head.value
        elsif @head.next != nil            
            current_node = @head.next
            i = 2
            while i < n
                current_node = current_node.next
                i += 1
            end

            if current_node != nil
                current_node.value
            else
                nil
            end
        else
            nil
        end
    end

    # Método que calcula el tamaño de la lista.
    # @return [Integer] Tamaño de la lista.
    def size
        if @head != nil
            current_node = @head

            size = 1

            while current_node.next != nil
                current_node = current_node.next

                size += 1
            end

            size
        else
            return 0
        end
    end


    # Método para dar formato texto a la información relevante de la clase de una manera estructurada.
    # @return [String] Información de la clase.
    def to_s
        current_node = @head

        print current_node.value.to_s

        while current_node.next != nil
            current_node = current_node.next

            print  ' -> ', current_node.value.to_s
        end
    end

end 

=begin
lentejas = {
    :nombre => "lentejas",
    :proteinas => 23.5,
    :glucidos => 52.0,
    :lipidos => 1.4,
    :gei => 0.4,
    :terreno => 3.4
}
=end
#binding.pry