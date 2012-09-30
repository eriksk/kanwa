module Kanwa	
	class Easing

		attr_accessor :type

		def initialize type = :linear
			@type = type
		end

		def lerp(x, y, weight)
			case @type
				when :linear
					Kanwa::lerp(x, y, weight)
				when :smooth 
					Kanwa::qlerp(x, y, weight)
			end
		end	
	end
end