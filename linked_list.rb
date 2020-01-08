class LinkedList

    def initialize
        @head = nil
    end

    def append node
        new_node = Node.new(node)
        if @head.nil?
            @head = new_node
        else
            temp = @head
            while temp.pointer
                temp = temp.pointer
            end
            temp.pointer = new_node
        end
    end

    def prepend node
        new_node = Node.new(node)
        if @head.nil?
            @head = new_node
        else
            new_node.pointer = @head
            @head = new_node
        end
    end

    def size
        if @head.nil?
            return 0
        else
            total = 0
            temp = @head
            while temp.pointer
                total += 1
                temp = temp.pointer
            end
            total += 1
            return total
        end
    end

    def head
        unless @head.nil?
            return @head.data.to_s
        end
    end

    def tail 
        unless @head.nil?
            temp = @head
            while temp.pointer
                temp = temp.pointer
            end
            return temp.data.to_s
        end
    end

    def at(index)
        counter = 0
        unless @head.nil?
            temp = @head
            while temp.pointer
                counter += 1
                temp = temp.pointer
                if counter == index
                    return temp.data.to_s
                end
            end
        end
    end

    def pop
        unless @head.nil?
            temp = @head
            while temp.pointer.pointer
                temp = temp.pointer
            end
            temp.pointer = nil
        end
    end

    def contains?(query)
        unless @head.nil?
            temp = @head
            while temp.pointer
                temp = temp.pointer
                if temp.data == query
                    return true
                end
            end
            return false
        end
    end

    def find(query)
        counter = 0
        unless @head.nil?
            temp = @head
            while temp.pointer
                temp = temp.pointer
                if temp.data == query
                    return counter
                else 
                    counter +=1
                end
            end
            return "data not found"
        end
    end

    def to_s
        if @head.nil?
            return "empty list"
        else
            string = ""
            temp = @head
            while temp.pointer
                string += "#{temp.data}, "
                temp = temp.pointer
            end
            string += "#{temp.data}"
            return string
        end
    end

    def insert_at node, index
        new_node = Node.new(node)
        temp = @head
        insert = 0
        while temp.pointer && insert != (index -1)
            temp = temp.pointer
            insert += 1
        end
        if insert == (index - 1) && temp.pointer
            new_node.pointer = temp.pointer
            temp.pointer = new_node
        else
            temp.pointer = new_node
        end
    end

    def remove_at node, index
        temp = @head
        remove = 0
        while temp.pointer && remove != (index -1)
            temp = temp.pointer
            remove += 1
        end
        if remove == (index - 1) && temp.pointer.pointer
            temp.pointer = temp.pointer.pointer
        else
            temp.pointer = nil
        end
    end
end

class Node

    attr_accessor :data, :pointer

    def initialize data = nil, pointer = nil
        @data = data
        @pointer = pointer
    end
end

list = LinkedList.new

puts list.to_s

list.append(7)
list.append(6)
list.append(9)
list.prepend(10)
list.prepend(21)


puts "First node: #{list.head}"
puts "last node: #{list.tail}"
puts list.to_s
puts "Size: #{list.size}"
puts "Data at index 3 : #{list.at(3)}"
puts "Contains '9'?: #{list.contains?(9)}"
puts "Index of data, '9': #{list.find(9)}"


list.pop
puts "POP!"

puts "First node: #{list.head}"
puts "last node: #{list.tail}"
puts list.to_s
puts "Size: #{list.size}"
puts "Data at index 3 : #{list.at(3)}"

puts "Contains '9'? : #{list.contains?(9)}"

puts "Location of '9': #{list.find(9)}"

puts "Inserting '9' in index 3..."
puts "Current list: #{list.to_s}"
list.insert_at(9,3)
puts "Current list: #{list.to_s}"
puts "Removing '9' from index 3..."

list.remove_at(9,3)
puts "Final list: #{list.to_s}"

