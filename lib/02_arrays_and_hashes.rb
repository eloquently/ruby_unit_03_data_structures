# Lecture covers:
# Arrays
# Hashes
# Monkey patching
# Recursion
# Blocks as arguments


# Write tests for and re-implement the following array functions as a monkey
# patch on the Array class. Do not use any of the built in array methods.
# You may use the custom methods you write to solve the later problems (e.g.
# use #my_each in your implementation of #my_select)

# Look up these functions in the ruby documentation to see what they do

# #each
# #select
# #reject
# #collect
# #inject
# #flatten

# Do the same for the following Hash functions:

# #each
# #has_key?
# #has_value?
# #keep_if
# #merge

class Array
    def my_each(&block)
        for i in 0..(self.count - 1) do
            block.call(self[i])
        end
    end
end