module RangeOperators
#= Rangify
#
#This module will add the rangify method to Ruby's Array class.
#The rangify method will produce appropriate ranges from the objects in the array.
#
#= Usage
#
#Examples:
#
#[1,2,3,6,7,8].rangify = [1..3, 6..8]
#
#[10..15, 16..20, 21, 22].rangify = [10..22]
#
#
#Assumes inclusive ranges (ie. 1..4) and range.first <= range.last.
#
#Works with integers, dates and strings.  However, all the objects in the array must be of the same class.
	module ArrayOperatorDefinitions
		def rangify
			array = self.sort_elements
			array.inject([]) do |collection, value|
				unless collection.empty?
					last = collection.last
					last_value = comparison_value(last, :last)
					current_value = comparison_value(value, :first)
					if (last_value + 1 <=> current_value) == -1
						collection << value
					else
						first = comparison_value(last, :first)
						second = [comparison_value(last, :last), comparison_value(value, :last)].max
						collection[-1] = [first..second]
						collection.flatten!
					end
				else
					collection << value
				end
			end
		end
		
		# Returns the values in common for an array set (nil, singe value/object, or range).
		def intersection
			array = self.sort_elements
			array.inject() do |common, element|
				value_first = comparison_value(common, :last)
				value_element = comparison_value(element, :first)
				case value_first <=> value_element
				when -1 then return nil
				when 0 then value_first
				else
					if element.class == Range 
						value_element..([value_first, comparison_value(element, :last)].min)
					else
						value_element
					end
				end
			end
		end
		
		#Returns the missing elements in an array set
		def missing
			missing, array = [], self.rangify
			i, length = 0, array.size - 1

			while i < length 
				current = comparison_value(array[i], :last)
				nextt = comparison_value(array[i+1], :first)
				missing << (current + 2 == nextt ? current + 1 : (current + 1)..(nextt - 1))
				i += 1
			end
			missing
		end

	  protected
		
		def sort_elements
			self.uniq.sort_by { |element| comparison_value(element, :first) }
		end

		private
		
		# For a Range, will return value.first or value.last. A non-Range will return itself.  
		def comparison_value(value, position)
			return value if value.class != Range
			position == :first ? value.first : value.last
		end
	end
end

class Array
  include RangeOperators::ArrayOperatorDefinitions
end