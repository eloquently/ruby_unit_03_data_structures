# Write tests for and re-implement the following array functions as a monkey
# patch on the Array class. Do not use any of the built in array methods.
# You may use the custom methods you write to solve the later problems (e.g.
# use #my_map in your implementation of #my_map)

# Look up these functions in the ruby documentation for Array or Enumerable
# to see what they do

# #each
# #select
# #reject
# #map (aka collect)
# #reduce (aka inject)
# #flatten (do this recursively for an extra challenge :) )

# Do the same for the following Hash functions:

# #each
# #has_key?
# #has_value?
# #keep_if
# #merge

class Array
    def my_each(&block)
        self.count.times do |i|
            block.call(self[i])
        end
    end
end