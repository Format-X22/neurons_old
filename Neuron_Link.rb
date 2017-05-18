class Neuron_Link
	attr_accessor :context, :group, :identity, :left, :right

	def initialize(left, right)
		@context = 0
		@group = 0
		@identity = 0

		@context_dump = 0
		@group_dump = 0
		@identity_dump = 0

		@left = left
		@right = right
	end

	def linked_with?(target)
		@left == target or @right == target;
	end

	def linked_with(target)
		if target == @left
			@right
		else
			@left
		end
	end
end