# frozen_string_literal: true

require "plume/version"
require "plume/lexer"

module Plume
	def self.tokenize(str)
		Lexer.new(str).tokenize
	end
end
