class Processor

	def initialize
		@words_index = {}
	end

	def put(string)
		neurons = []

		string.split(/[^[[:word:]]]+/).each do |word|
			indexed = @words_index[word]

			if indexed
				neurons.push(indexed);
			else
				neuron = Neuron.new(word)

				neurons.push(neuron)
				@words_index[word] = neuron
			end
		end

		len = neurons.length - 1
		i = len
		j = 0

		while i >= 0
			while j > i
				neurons[i].inc_context(neurons[j], 1)

				j -= 1
			end

			j = len
			i -= 1
		end
	end

	def neurons_context_for(string)
		neurons = []
		association = {}
		result = []

		string.split(/[^[[:word:]]]+/).each do |word|
			neuron = @words_index[word]

			if neuron
				neurons.push(neuron)
			end
		end

		neurons.each do |root_neuron|
			root_neuron.all_linked.each do |neuron|
				cur = association[neuron]

				if cur
					association[neuron] = cur + 1
				else
					association[neuron] = 1
				end
			end
		end

		association.each do |neuron, counter|
			if counter === neurons.length
				result.push(neuron.meta)
			end
		end

		p result.join(', ')
	end
end