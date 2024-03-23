# frozen_string_literal: true

module Feather
	class Lexer
		module Characters
			class Type
				include Comparable

				def self.[](index) = new(index)

				def initialize(index)
					@index = index
				end

				def inspect = "#{self.class.name}[#{@index}]"

				def ===(character)
					character_index = if String === character
						Character::TYPE_MAP[character.ord]
					elsif Character === character
						character.type
					end

					character_index == @index
				end

				def <=>(integer) = @index <=> integer

				def coerce(other) = [other, @index]
			end

			X					=		Type[0]			# The letter 'x', or start of BLOB literal
			KYWD0			=		Type[1]			# First letter of a keyword
			KYWD			=		Type[2]			# Alphabetics or '_'.  Usable in a keyword
			DIGIT			=		Type[3]			# Digits
			DOLLAR		=		Type[4]			# '$'
			VARALPHA	=		Type[5]			# '@', '#', ':'.  Alphabetic SQL variables
			VARNUM		=		Type[6]			# '?'.  Numeric SQL variables
			SPACE			=		Type[7]			# Space characters
			QUOTE			=		Type[8]			# '"', '\'', or '`'.  String literals, quoted ids
			QUOTE2		=		Type[9]			# '['.   [...] style quoted ids
			PIPE			=		Type[10]		# '|'.   Bitwise OR or concatenate
			MINUS			=		Type[11]		# '-'.  Minus or SQL-style comment
			LT				=		Type[12]		# '<'.  Part of < or <= or <>
			GT				=		Type[13]		# '>'.  Part of > or >=
			EQ				=		Type[14]		# '='.  Part of = or ==
			BANG			=		Type[15]		# '!'.  Part of !=
			SLASH			=		Type[16]		# '/'.  / or c-style comment
			LP				=		Type[17]		# '('
			RP				=		Type[18]		# ')'
			SEMI			=		Type[19]		# ';'
			PLUS			=		Type[20]		# '+'
			STAR			=		Type[21]		# '*'
			PERCENT		=		Type[22]		# '%'
			COMMA			=		Type[23]		# ','
			AND				=		Type[24]		# '&'
			TILDA			=		Type[25]		# '~'
			DOT				=		Type[26]		# '.'
			ID				=		Type[27]		# unicode characters usable in IDs
			ILLEGAL		=		Type[28]		# Illegal character
			NUL				=		Type[29]		# 0x00
			BOM				=		Type[30]		# First byte of UTF8 BOM:  0xEF 0xBB 0xBF
		end
	end
end
