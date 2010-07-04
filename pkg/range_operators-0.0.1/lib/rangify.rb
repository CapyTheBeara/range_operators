#= Rangify
#
#This gem will add the rangify method to Ruby's Array class.
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

module Rangify
	def rangify
    array = self.uniq.sort_by { |element| comparison_value(element, :first) }
    array.inject([]) do |collection, value|
      unless collection.empty?
        last = collection.last
        last_value = comparison_value(last, :last)
        current_value = comparison_value(value, :first)
        if (last_value.succ <=> current_value) == -1
          collection << value
        else
          first = [comparison_value(last, :first), comparison_value(value, :first)].min
          second = [comparison_value(last, :last), comparison_value(value, :last)].max
          collection[-1] = [first..second]
          collection.flatten!
        end
      else
        collection << value
      end
    end
  end

  private

  # For a Range, will return value.first or value.last. A non-Range will return itself.  
  def comparison_value(value, position)
    return value if value.class != Range
    position == :first ? value.first : value.last
  end
end

class Array
  include Rangify
end