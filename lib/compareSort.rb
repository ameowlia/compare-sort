class CompareSort
  def self.bubble(data, time = false)

  	if time 
  		lam = lambda { BubbleSort.run(data) }
  		return self.time(lam)
  	else 
    	return BubbleSort.run(data)
    end

  end

  def self.modBubble(data, time = false)
  	if time 
  		lam = lambda { ModifiedBubbleSort.run(data) }
  		return self.time(lam)
  	else 
    	return ModifiedBubbleSort.run(data)
    end
    
  end 

  def self.time(sorting_method)
  	start_time = Time.now
  	sorted_list = sorting_method.call 
  	end_time = Time.now

  	return end_time - start_time
  end 
end




class SelectionSort
	def self.run(data)

		len = data.length

		# iterate through each element in the array
		data.each_with_index do |datum, datum_index|
			min_spot = datum_index

			# iterate through all elements past datum
			(len - datum_index).times do |j|
				current_index = j + datum_index

				# If found a new min, save the location
				if data[current_index] < data[min_spot]
					min_spot = current_index
				end 
			end 

			min = data[min_spot]
			data[min_spot] = datum
			data[datum_index] = min


		end

		return data

	end


end 


class ModifiedBubbleSort
	def self.run(data)
		# Make sure there are at least 2 items in the array
		# Create iterators

		sorted = false 
		
		# counter = 1
		while !sorted 
			sorted = true
			(data.length - 1).times  do |i|
				if (data[i] > data[i+1])
					low_value = data[i+1]
					data[i+1] = data[i]
					data[i] = low_value
					sorted = false 
				end
			end 
		end

		return data

	end
end 

class BubbleSort
	def self.run(data)
		# Make sure there are at least 2 items in the array
		# Create iterators

		sorted = false 
		
		# counter = 1
		(data.length).times  do |i|


			(data.length - 1).times  do |j|
				if (data[j] > data[j+1])
					low_value = data[j+1]
					data[j+1] = data[j]
					data[j] = low_value
				end
			end 
		end

		return data

	end
end 