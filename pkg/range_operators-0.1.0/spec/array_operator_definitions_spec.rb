require 'lib/range_operators'

describe Array do
	describe '#missing' do
		it { [1,3..3].missing.should == [2] }
		it { [1..5,10..12].missing.should == [6..9] }
		it { [100, 9..11, 14, 1..5, 16, 10..12, 17..17].missing.should == [6..8, 13, 15, 18..99] }
	end

	describe '#intersection' do
		it { [1, 2].intersection.should == nil }
		it { [1..10, 11..20].intersection.should == nil }
		it { [1..10, 5..15, 11..20].intersection.should == nil }
		it { [8..8, 1..10, 10 ].intersection.should == nil }
		it { [10, 1..10].intersection.should == 10 }
		it { [1..10, 1].intersection.should == 1 }
		it { [1, 1].intersection.should == 1 }
		it { [1..10, 5, 5..8, 5..10 ].intersection.should == 5 }
		it { [1..10, 5..8, 5..10 ].intersection.should == (5..8) }
		it { [5..10, 1..10, 4..8 ].intersection.should == (5..8) }
		it { [5..10, 1..10, 4..20, 8].intersection.should == 8 }

	end
	
	describe '#rangify' do

		it 'An array of consecutive integers should return an array made up of a single range.' do
			[1,2,3,4,5].rangify.should == [1..5]
		end
		
		it 'An array of non-consecutive integers should return the original array.' do
			[1,3,5,7].rangify.should == [1,3,5,7]
		end

		describe 'An array of consecutive and non-consecutive integers' do
			before :each do
				@result = [1..3, 6..8, 10, 15] 
			end

			it 'should return the correct ranges.' do
				[1,2,3,6,7,8,10,15].rangify.should == @result
			end
		
			it 'Array element order should not affect the result.' do
				[8, 1, 15, 2, 6, 3, 7, 10].rangify.should == @result
			end
			
			it 'Duplicate elements should not affect the result.' do
				[8, 1, 15, 2, 6, 3, 7, 10, 8, 15, 2, 3, 1, 2].rangify.should == @result
			end
		end
			
		it 'An array of ranges should return the correct ranges.' do
			arr = [40..45, 1..3, 4..10, 20..30, 24..28, 42..50, 1..6, 1..3, 1..1]
			arr.rangify.should == [1..10, 20..30, 40..50]
		end
		
		it 'An array of ranges and integers should return the correct ranges.' do
			arr = [99, 100, 1..3, 101, 4..5, 103, 10..19, 99, 20..20, 31, 32..33, 98, 97]
			arr.rangify.should == [1..5, 10..20, 31..33, 97..101, 103]
		end	
	end
end