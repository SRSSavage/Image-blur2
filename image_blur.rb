class Image
	attr_accessor :image 
  def initialize(array)
    @image = array
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
	end

	def blur
		coordnates = []
		@image.each_with_index do |row, row_i| #iterate through rows
			row.each_with_index do |value, value_i| #iterates through values of each row
				if value == 1
					coordnates << [row_i, value_i] #pushes indexes into an array
				end
			end
		end

		coordnates.each do |coordnate|
			row_coordnate = coordnate[0]  #selects each coordnate 
			value_coordnate = coordnate[1]
			@image[row_coordnate + 1][value_coordnate] = 1 if row_coordnate < @image.length - 1 
			@image[row_coordnate -1][value_coordnate] = 1 if row_coordnate > 0 
			@image[row_coordnate][value_coordnate + 1] = 1 if value_coordnate < @image.length - 1 
			@image[row_coordnate][value_coordnate - 1] = 1 if value_coordnate > 0
		end
		puts "Blured Image"
		@image.each do |row|
			puts row.join
		end
	end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
image.blur