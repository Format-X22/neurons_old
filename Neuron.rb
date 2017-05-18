require_relative './Neuron_Link'

class Neuron
	attr_reader :meta, :links

	def initialize(meta)
		@meta = meta
		@links = []
	end

	def inc_context(target, value)
		provide_link(target).context += value
	end

	def inc_group(target, value)
		provide_link(target).group += value
	end

	def inc_identity(target, value)
		provide_link(target).identity += value
	end

	def all_linked
		@links.map do |link|
			link.linked_with(self);
		end
	end

	private

	def provide_link(target)
		link = link_for(target)

		unless link
			link = Neuron_Link.new(self, target)

			@links.push(link)
			target.links.push(link)
		end

		link
	end

	def link_for(target)
	    @links.each do |link|
			if link.linked_with?(target)
				return link
			end
		end

		nil
	end
end