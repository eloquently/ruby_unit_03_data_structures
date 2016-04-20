class LinkedNode
    attr_accessor :value, :next_element
    def initialize(value, next_element)
        self.value = value
        self.next_element = next_element
    end
end

def list_to_string(start)
    str = ''
    while !start.nil?
        str = "#{str}#{start.value}"
        start = start.next_element
    end
    return str
end

def last_element(start)
    until start.next_element.nil?
        start = start.next_element
    end
    return start
end

def add_element_to_end(start, new_value)
    last_element(start).next_element = LinkedNode.new(new_value, nil)
end

def add_element_to_beginning(start, new_value)
    new_start = LinkedNode.new(new_value, start)
    return new_start
end

def delete_element(start, position)
    return start.next_element if position == 0
    before_del = start
    (position-1).times { before_del = before_del.next_element }
    before_del.next_element = before_del.next_element.next_element
    return start
end

def reverse_list(start)
    last = last_element(start)
    e = start
    prev = nil
    while e != last
        next_e = e.next_element
        e.next_element = prev
        prev = e
        e = next_e
    end
    e.next_element = prev
    return last
end

def list_has_cycle?(start)
    elements_found = []
    e = start
    until e == nil do
        return true if elements_found.include? e
        elements_found << e
        e = e.next_element
    end
    return false
end