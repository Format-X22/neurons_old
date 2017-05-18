require_relative './Neuron'
require_relative './Processor'

processor = Processor.new

processor.put('в лесу живет волк')
processor.put('в лесу живет заяц')
processor.put('в лесу живет медведь')

processor.neurons_context_for('кто живет в лесу ?')

