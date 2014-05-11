require 'spec_helper'

describe Range do
	describe '#+' do
		describe 'when given a range of integers' do
			
			it { lambda{ (1..10) + 'a' }.should raise_error }

			it { ((1..10) + (11..11)).should == [1..11] }
			
			it { ((1..10) + 12).should == [1..10, 12] }

			it { ((1..10) + (10..12)).should == [1..12] }

			it { ((1..10) + (11..12)).should == [1..12] }

			it { ((1..10) + (9..12)).should == [1..12] }

			it { ((1..10) + (1..12)).should == [1..12] }
			
			it { ((1..10) + (12..20)).should == [1..10, 12..20] }

			it { ((1..10) + 0).should == [0..10] }

			it { ((1..10) + -1).should == [-1, 1..10] }
			
			it { ((1..10) + (-10..-1)).should == [-10..-1, 1..10] }

			it { ((1..10) + (-10..0)).should == [-10..10] }
			
			it { ((1..10) + (-10..1)).should == [-10..10] }
			
			it { ((1..10) + (-10..2)).should == [-10..10] }
			
			it { ((1..10) + (-10..20)).should == [-10..20]}
		end
	end

	describe '#-' do
		describe 'when given a range of integers' do

			it { lambda{ (1..10) - 'a' }.should raise_error }
						
			describe 'and subtracting an integer' do

				it { ((1..10) - (5..5)).should == [1..4, 6..10] }
				
				it { ((1..10) - 2).should == [1, 3..10] }
				
				it { ((1..10) - 9).should == [1..8, 10] }
					
				it { ((1..10) - 10).should == [1..9, nil] }
					
				it { ((1..10) - 1).should == [nil, 2..10] }
					
				it { ((1..10) - 11).should == [1..10, nil] }
					
				it { ((1..10) - 12).should == [1..10, nil] }
					
				it { ((1..10) - 0).should == [nil, 1..10] }
					
				it { ((1..10) - -1).should == [nil, 1..10] }
			end
		
			describe 'and subtracting another range' do

				it { ((1..10) - (4..6)).should == [1..3, 7..10] }
					
				it { ((1..10) - (2..6)).should == [1, 7..10] }
					
				it { ((1..10) - (4..9)).should == [1..3, 10] }
					
				it { ((1..10) - (2..9)).should == [1, 10] }
					
				it { ((1..10) - (2..11)).should == [1] }
					
				it { ((1..10) - (0..9)).should == [10] }
									
				it { ((1..10) - (4..10)).should == [1..3] }
					
				it { ((1..10) - (4..12)).should == [1..3] }
					
				it { ((1..10) - (1..6)).should == [7..10] }
					
				it { ((1..10) - (-2..6)).should == [7..10] }
					
				it { ((1..10) - (11..20)).should == [1..10] }
					
				it { ((1..10) - (-10..0)).should == [1..10] }
					
				it { ((1..10) - (-10..20)).should == [] }
			end
		end
	end
	
	it '#minus is an alias of #-' do
		Range.instance_method(:minus).should == Range.instance_method(:-)
	end

	it '#plus is an alias of #+' do
		Range.instance_method(:plus).should == Range.instance_method(:+)
	end
end