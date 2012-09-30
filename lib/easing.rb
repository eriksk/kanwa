module Kanwa	
	class Easing

		def name
			"Linear"
		end

		def lerp(x, y, weight)
			x + (y - x) * weight
		end	
	end

	class EasingSmooth < Easing
		def name
			"Smooth"
		end
		
		def lerp(x, y, weight)
			qlerp(x, y, weight)
		end	
	end
end