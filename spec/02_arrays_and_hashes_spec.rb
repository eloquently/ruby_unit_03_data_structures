require '02_arrays_and_hashes'

describe Array do

    before :each do
       @array = [1, 2, 3, 4 ,5]
    end

    describe '#my_each' do
        it 'outputs each element' do
            expect { @array.my_each { |a| print "#{a}-" } }.to output('1-2-3-4-5-').to_stdout
        end
    end
end