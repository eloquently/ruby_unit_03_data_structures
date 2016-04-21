require 'arrays_and_hashes'

describe Array do

    let(:array) { [1, 2, 3, 4, 5] }

    describe '#my_each' do
        it 'outputs each element' do
            expect { array.my_each { |a| print "#{a}" } }.to output('12345').to_stdout
        end
    end

    describe '#my_reduce' do
        it 'calculates sum' do
            expect( array.my_reduce { |sum, a| sum + a } ).to eq(1 + 2 + 3 + 4 + 5)
        end
        it 'calculates product' do
            expect( array.my_reduce { |prod, a| prod * a } ).to eq(1 * 2 * 3 * 4 * 5)
        end
    end
end