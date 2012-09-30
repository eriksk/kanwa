module Kanwa	
	class Animation

		attr_accessor :frames, :key_frames, :current_frame, :current, :x, :y

		def initialize(frames, key_frames)
			@frames = frames
			@key_frames = key_frames
			@x, @y = 0, 0
			reset
		end

		def reset
			@current = 0.0
			@current_frame = 0
		end

		def next_frame
			if @current_frame + 1 > @key_frames.size - 1
				@key_frames[0]
			else
				@key_frames[@current_frame + 1]
			end
		end

		def update dt
			@current += dt
			if @current > @key_frames[@current_frame].duration
				@current = 0.0
				@current_frame += 1
				if @current_frame > @key_frames.size - 1
					@current_frame = 0
				end
			end
		end

		def draw
			if @current_frame < @key_frames.size
				@key_frames[@current_frame].draw current, next_frame, @x, @y
			end
		end	
	end
end