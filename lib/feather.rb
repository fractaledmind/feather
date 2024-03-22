# frozen_string_literal: true

require "zeitwerk"

module Feather
	Loader = Zeitwerk::Loader.for_gem.tap do |loader|
		loader.setup
		loader.inflector.inflect(
		)
	end
end
