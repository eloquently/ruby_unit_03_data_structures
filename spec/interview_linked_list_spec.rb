require 'interview_linked_list'

# Linked lists are a simple data structure.
# You can implement a linked list as a class with two instance variables:
#   1) a value
#   2) a reference to the next item in the list

# Linked lists are not used in practice, but they are a popular target of
# interview questions.

# Work through this file implementing the methods from top to bottom.
# You can re-use methods that you have already implemented.

describe 'LinkedNode' do

    let(:ll_2) { LinkedNode.new(2, nil) } # The last element points to next
    let(:ll_1) { LinkedNode.new(1, ll_2) }

    it 'has a value' do
        expect(ll_1.value).to eq(1)
    end

    it 'has a next element' do
        expect(ll_1.next_element).to eq(ll_2)
    end

end

# Now that our linked list is set up, let's write some methods to modify them


describe 'Interview Questions' do


    # This will create a linked list with 5 elements
    # 1 -> 2 -> 3 -> 4 -> 5 -> nil

    let(:ll_start) do
        next_element = nil
        5.downto(1) do |i|
            next_element = LinkedNode.new(i, next_element)
        end
        return next_element
    end

    let(:ll2_start) do
        next_element = nil
        ['a','b','c','d','e','f','g'].reverse.each do |i|
            next_element = LinkedNode.new(i, next_element)
        end
        return next_element
    end

    # These methods should just be unattached methods in the
    # interview_linked_list.rb file (put them under your linked list)
    # class declaration

    # First question:
    # Write a method that will return a string with the elements in a
    # linked list given the starting element
    describe '#list_to_string' do
        it 'converts list to string' do
            expect(list_to_string(ll_start)).to eq('12345')
            expect(list_to_string(ll2_start)).to eq('abcdefg')
        end
    end

    # Write a method that will return the last element of the list
    # given the starting element
    describe '#last_element' do
        it 'returns last value' do
            expect(last_element(ll_start).value).to eq(5)
            expect(last_element(ll2_start).value).to eq('g')
        end
        it 'returns first value if list has one element' do
            expect(last_element(LinkedNode.new(1, nil)).value).to eq(1)
        end
    end

    # Write a method that will add a new element to the end of the
    # linked list given the starting element of the list and the value
    # of the new element
    describe '#add_element_to_end' do
        it 'adds element to end' do
            add_element_to_end(ll_start, 6)
            expect(list_to_string(ll_start)).to eq('123456')
            add_element_to_end(ll2_start, 'h')
            expect(list_to_string(ll2_start)).to eq('abcdefgh')
        end
    end

    # Write a method that will add a new element to the beginning of
    # the linked list given the starting element of the list. This
    # method should return the new first element of the list.
    describe '#add_element_to_beginning' do
        it 'adds element to beginning' do
            new_start = add_element_to_beginning(ll_start, 0)
            expect(list_to_string(new_start)).to eq('012345')
            new_start2 = add_element_to_beginning(ll2_start, 'A')
            expect(list_to_string(new_start2)).to eq('Aabcdefg')
        end
    end

    # Write a method that will delete an element at a given position
    # (starting at 0) in the list and return the list
    describe '#delete_element' do
        it 'deletes element from list' do
            delete_element(ll_start, 3)
            expect(list_to_string(ll_start)).to eq('1235')
            delete_element(ll2_start, 4)
            expect(list_to_string(ll2_start)).to eq('abcdfg')
        end

        it 'deletes first element from list' do
            new_start = delete_element(ll_start, 0)
            expect(list_to_string(new_start)).to eq('2345')
        end
    end

    # Write a method that will reverse the elements of a linked list
    # E.g. if the original list is 1 -> 2 -> 3
    #         the new list will be 3 -> 2 -> 1
    # the method should return the first element of the new list
    describe '#reverse_list' do
        it 'reverses list' do
            new_start = reverse_list(ll_start)
            expect(list_to_string(new_start)).to eq('54321')
            new_start2 = reverse_list(ll2_start)
            expect(list_to_string(new_start2)).to eq('gfedcba')
        end
    end

    # It's possible for a linked list to have a cycle.
    # 1 -> 2 -> 3
    #      ^    |
    #      |    |
    #      ------
    # Write a method to describe if there is a cycle in a list
    # given the starting element of a list

    let(:cycle_start) do
        ll_3 = LinkedNode.new(3, nil)
        ll_2 = LinkedNode.new(2, ll_3)
        ll_3.next_element = ll_2
        return LinkedNode.new(1, ll_2)
    end
    describe '#list_has_cycle?' do
        it 'detects cycle if there is one' do
            expect(list_has_cycle?(cycle_start)).to be(true)
        end

        it 'does not detect cycle if there is not one' do
            expect(list_has_cycle?(ll_start)).to be(false)
        end
    end

    # Bonus question (optional)
    # Write a method (and tests for the method) that returns the
    # length of the cycle if there is one.


    # Bonus question (optional)
    # We implemented a deep_dup method on the array class
    # However, the method that we implemented was not very deep --
    # it only made a deep duplicate of 2D arrays. It would not
    # work properly on a 3D arrays or higher.
    # Write a recursive deep_dup function that works on all
    # levels of the array (and write the tests for it)
end
