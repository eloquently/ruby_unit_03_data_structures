require '01_arrays_and_hashes'

describe Array do

    let(:array) { [1, 2, 3, 4, 5] }

    describe '#my_each' do
        it 'outputs each element' do
            expect { array.my_each { |a| print "#{a}-" } }.to output('1-2-3-4-5-').to_stdout
        end
    end
end