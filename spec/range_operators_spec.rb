require 'lib/range_operators'

describe RangeOperators do
	describe '#+' do
		describe 'when given a range of integers' do
			before :each do
				@range = 1..10
			end
			
			it '1..10 + 11  = [1..11]' do
				(@range + 11).should == [1..11]
			end
			
			it '1..10 + 12 = [1..10, 12]' do
				(@range + 12).should == [1..10, 12]
			end

			it '1..10 + 10..12 = [1..12]' do
				(@range + (10..12)).should == [1..12]
			end

			it '1..10 + 11..12 = [1..12]' do
				(@range + (11..12)).should == [1..12]
			end

			it '1..10 + 9..12 = [1..12]' do
				(@range + (9..12)).should == [1..12]
			end

			it '1..10 + 1..12 = [1..12]' do
				(@range + (1..12)).should == [1..12]
			end

			it '1..10 + 12..20 = [1..10, 12..20]' do
				(@range + (12..20)).should == [1..10, 12..20]
			end

			it '1..10 + 0 = [0..10]' do
				(@range + 0).should == [0..10]
			end

			it '1..10 + -1 = [-1, 1..10]' do
				(@range + -1).should == [-1, 1..10]
			end			

			it '1..10 + (-10..-1) = [-10..-1, 1..10]' do
				(@range + (-10..-1)).should == [-10..-1, 1..10]
			end		

			it '1..10 + (-10..0) = [-10..10]' do
				(@range + (-10..0)).should == [-10..10]
			end		

			it '1..10 + (-10..1) = [-10..10]' do
				(@range + (-10..1)).should == [-10..10]
			end		

			it '1..10 + (-10..2) = [-10..10]' do
				(@range + (-10..2)).should == [-10..10]
			end		

			it '1..10 + (-10..20) = [-10..20]' do
				(@range + (-10..20)).should == [-10..20]
			end		
		end
	end

	describe '#-' do
		describe 'when given a range of integers' do
			before :each do
				@range = 1..10 
			end
			
			it 'should raise error if subtracting a non-integer' do
				lambda{@range - 'a'}.should raise_error
			end
			
			describe 'and subtracting an integer' do
				it '(1..10) - 5 = [1..4, 6..10]' do
					(@range - 5).should == [1..4, 6..10]
				end

				it '(1..10) - 2 = [1, 3..10]' do
					(@range - 2).should == [1, 3..10]
				end

				it '(1..10)- 9 = [1..8, 10]' do
					(@range - 9).should == [1..8, 10]
				end

				it '(1..10) - 10 = [1..9, nil]' do
					(@range - 10).should == [1..9, nil]
				end

				it '(1..10) - 1 = [nil, 2..10]' do
					(@range - 1).should == [nil, 2..10]
				end

				it '(1..10) - 11 = [1..10, nil]' do
					(@range - 11).should == [1..10, nil]
				end

				it '(1..10) - 12 = [1..10, nil]' do
					(@range - 12).should == [1..10, nil]
				end

				it '(1..10) - 0 = [nil, 1..10]' do
					(@range - 0).should == [nil, 1..10]
				end

				it '(1..10) - -1 = [nil, 1..10]' do
					(@range - -1).should == [nil, 1..10]
				end
			end
		
			describe 'and subtracting another range' do

				it '1..10 - 4..6 = [1..3, 7..10]' do
					(@range - (4..6)).should == [1..3, 7..10]
				end

				it '1..10 - 2..6 = [1, 7..10]' do
					(@range - (2..6)).should == [1, 7..10]
				end

				it '1..10 - 4..9 = [1..3, 10]' do
					(@range - (4..9)).should == [1..3, 10]
				end

				it '1..10 - 2..9 = [1, 10]' do
					(@range - (2..9)).should == [1, 10]
				end

				it '1..10 - 2..11 = [1]' do
					(@range - (2..11)).should == [1]
				end

				it '1..10 - 0..9 = [10]' do
					(@range - (0..9)).should == [10]
				end
				
				it '1..10 - 4..10 = [1..3]' do
					(@range - (4..10)).should == [1..3]
				end

				it '1..10 - 4..12 = [1..3]' do
					(@range - (4..12)).should == [1..3]
				end

				it '1..10 - 1..6 = [7..10]' do
					(@range - (1..6)).should == [7..10]
				end

				it '1..10 - (-2..6) = [7..10]' do
					(@range - (-2..6)).should == [7..10]
				end

				it '1..10 - 11..20 = [1..10]' do
					(@range - (11..20)).should == [1..10]
				end

				it '1..10 - (-10..0) = [1..10]' do
					(@range - (-10..0)).should == [1..10]
				end

				it '1..10 - (-10..20) = []' do
					(@range - (-10..20)).should == []
				end
			end
		end
	end
	
	it '#minus is an alias of #-' do
		RangeOperators.instance_method(:minus).should == RangeOperators.instance_method(:-)
	end

	it '#plus is an alias of #+' do
		RangeOperators.instance_method(:plus).should == RangeOperators.instance_method(:+)
	end
end