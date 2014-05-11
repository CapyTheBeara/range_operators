module RangeOperators
#Will add range operations ('+' and '-') to Ruby's Range class.
#Requires that the second operand have a '- (integer)' method defined (ie. Fixnum, Bignum, and Date).
#Assumes inclusive ranges (ie. 1..4) and range.first <= range.last.
#Values returned from the operations are in an array.
	module RangeOperatorDefinitions
	
		def +(value)
			[self, value].rangify
		end

		alias plus +
		
		def -(value)
			if value.class == self.first.class
				self.minus_obj(value)
			else
				[self.minus_obj(value.first)[0], self.minus_obj(value.last)[1]].compact
			end
		end
		
		alias minus -
		
		protected
		
		def minus_obj(value)
			first = case value <=> self.first + 1
			when -1 then nil
			when 0 then self.first
			else
				value < self.last + 1 ? self.first..(value - 1) : self
			end

			second = case self.last <=> value + 1
			when -1 then nil
			when 0 then self.last
			else
				value + 1 > self.first ? value + 1..self.last : self
			end

			[first, second]
		end
	end
end

class Range
	include RangeOperators::RangeOperatorDefinitions
end