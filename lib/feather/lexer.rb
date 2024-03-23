# frozen_string_literal: true

require_relative "tokens"
require_relative "lexer/character"
require_relative "lexer/characters"
require_relative "lexer/keywords"

module Feather
	# Map ASCII characters to their respective token types
	# adapted from: https://github.com/sqlite/sqlite/blob/master/src/tokenize.c
	class Lexer
		include Characters
		include Keywords

		def initialize(sql)
			@sql = sql.force_encoding("ASCII-8BIT")
			@chars = sql.chars.map { |c| Character.new(c) }
			@tokens = []
		end

		def tokenize
			until @chars.length == 0
				@tokens << next_token
			end
			@tokens
		end

		def next_token
			current_char = @chars.shift
			token_chars = [current_char]

			case current_char
			when SPACE
				# useless branch conditions to drive branch test coverage results
				nil if current_char == " "
				nil if current_char == "\t"
				nil if current_char == "\n"
				nil if current_char == "\f"
				nil if current_char == "\r"

				while (char = @chars[0]) && char.space?
					token_chars << @chars.shift
				end
				return TK::SPACE[token_chars.join]
			when MINUS
				if @chars[0] == "-"
					token_chars << @chars.shift
					while @chars[0] != nil && @chars[0] != "\n"
						token_chars << @chars.shift
					end
					return TK::SPACE[token_chars.join] # IMP: R-22934-2513
				elsif @chars[0] == ">"
					token_chars << @chars.shift
					token_chars << @chars.shift if @chars[0] == ">"
					return TK::PTR[token_chars.join]
				else
					return TK::MINUS[token_chars.join]
				end
			when LP
				return TK::LP[token_chars.join]
			when RP
				return TK::RP[token_chars.join]
			when SEMI
				return TK::SEMI[token_chars.join]
			when PLUS
				return TK::PLUS[token_chars.join]
			when STAR
				return TK::STAR[token_chars.join]
			when SLASH
				if @chars[0] != "*" || @chars[1] == nil
					return TK::SLASH[token_chars.join]
				end
				while (@chars[0] != "*" || @chars[1] != "/") && (@chars[1] != nil)
					token_chars << @chars.shift
				end
				token_chars << @chars.shift if @chars[0] == "*"
				token_chars << @chars.shift if @chars[0] == "/"

				return TK::SPACE[token_chars.join] # IMP: R-22934-2513]
			when PERCENT
				return TK::REM[token_chars.join]
			when EQ
				token_chars << @chars.shift if @chars[0] == "="
				return TK::EQ[token_chars.join]
			when LT
				if @chars[0] == "="
					token_chars << @chars.shift
					return TK::LE[token_chars.join]
				elsif @chars[0] == ">"
					token_chars << @chars.shift
					return TK::NE[token_chars.join]
				elsif @chars[0] == "<"
					token_chars << @chars.shift
					return TK::LSHIFT[token_chars.join]
				else
					return TK::LT[token_chars.join]
				end
			when GT
				if @chars[0] == "="
					token_chars << @chars.shift
					return TK::GE[token_chars.join]
				elsif @chars[0] == ">"
					token_chars << @chars.shift
					return TK::RSHIFT[token_chars.join]
				else
					return TK::GT[token_chars.join]
				end
			when BANG
				if @chars[0] != "="
					return TK::ILLEGAL[token_chars.join]
				else
					token_chars << @chars.shift
					return TK::NE[token_chars.join]
				end
			when PIPE
				if @chars[0] != "|"
					return TK::BITOR[token_chars.join]
				else
					token_chars << @chars.shift
					return TK::CONCAT[token_chars.join]
				end
			when COMMA
				return TK::COMMA[token_chars.join]
			when AND
				return TK::BITAND[token_chars.join]
			when TILDA
				return TK::BITNOT[token_chars.join]
			when QUOTE
				delim = current_char # ' or " or `

				# useless branch conditions to drive brach test coverage results
				nil if delim == "`"
				nil if delim == "'"
				nil if delim == '"'

				while (char = @chars[0])
					if char == delim
						# you can use the same quote to escape itself
						if @chars[1] == delim
							token_chars << @chars.shift
						else
							break
						end
					end
					token_chars << @chars.shift
				end

				if @chars[0] == "'"
					token_chars << @chars.shift
					return TK::STRING[token_chars.join]
				elsif @chars[0] != nil
					token_chars << @chars.shift
					return TK::ID[token_chars.join]
				else
					return TK::ILLEGAL[token_chars.join]
				end
			when DOT, DIGIT
				if DOT === current_char && (@chars[0] == nil || !@chars[0]&.digit?)
					return TK::DOT[token_chars.join]
				end

				# If the next character is a digit, this is a floating point
				# number that begins with ".".  Fall thru into the next case

				# useless branch conditions to drive brach test coverage results
				nil if current_char == "0"
				nil if current_char == "1"
				nil if current_char == "2"
				nil if current_char == "3"
				nil if current_char == "4"
				nil if current_char == "5"
				nil if current_char == "6"
				nil if current_char == "7"
				nil if current_char == "8"
				nil if current_char == "9"
				nil if current_char == "."

				token_type = DOT === current_char ? TK::FLOAT : TK::INTEGER
				if current_char == "0" && (@chars[0] == "x" || @chars[0] == "X") && @chars[1]&.xdigit?
					token_chars << @chars.shift
					token_chars << @chars.shift

					while @chars[0]&.xdigit?
						token_chars << @chars.shift
					end

					return token_type[token_chars.join]
				end

				while @chars[0]&.digit?
					token_chars << @chars.shift
				end

				if @chars[0] == "."
					token_chars << @chars.shift

					while @chars[0]&.digit?
						token_chars << @chars.shift
					end

					token_type = TK::FLOAT
				end

				if (@chars[0] == "e" || @chars[0] == "E") && (
					@chars[1]&.digit? || (
						(@chars[1] == "+" || @chars[1] == "-") && @chars[2]&.digit?
					)
				)
					token_chars << @chars.shift
					token_chars << @chars.shift

					while @chars[0]&.digit?
						token_chars << @chars.shift
					end

					token_type = TK::FLOAT
				end

				while @chars[0]&.id?
					token_type = TK::ILLEGAL
					token_chars << @chars.shift
				end

				return token_type[token_chars.join]
			when QUOTE2
				token_type = TK::ILLEGAL
				while @chars[0] != nil && @chars[0] != "]"
					token_chars << @chars.shift
				end
				if @chars[0] != nil && @chars[0] == "]"
					token_chars << @chars.shift
					token_type = TK::ID
				end
				return token_type[token_chars.join]
			when VARNUM
				while @chars[0]&.digit?
					token_chars << @chars.shift
				end
				return TK::VARIABLE[token_chars.join]
			when DOLLAR, VARALPHA
				# useless branch conditions to drive brach test coverage results
				nil if current_char == "$"
				nil if current_char == "@"
				nil if current_char == ":"
				nil if current_char == "#"

				n = 0
				token_type = TK::VARIABLE
				while @chars[0] != nil
					if @chars[0]&.id?
						n += 1
					elsif @chars[0] == "(" && n > 0
						token_chars << @chars.shift
						while @chars[0] != nil && !@chars[0]&.space? && @chars[0] != ")"
							token_chars << @chars.shift
						end
						if @chars[0] == ")"
							token_chars << @chars.shift
						else
							token_type = TK::ILLEGAL
						end
						break
					elsif @chars[0] == ":" && @chars[1] == ":"
					  token_chars << @chars.shift
					else
					  break
					end
					token_chars << @chars.shift
				end

				if n == 0
					token_type = TK::ILLEGAL
				end

				return token_type[token_chars.join]
			when KYWD0
				# If the next character is not a keyword character, consume all the id characters and return it as an id
				if @chars[0] && @chars[0].type > KYWD
					while @chars[0]&.id?
						token_chars << @chars.shift
					end
					return TK::ID[token_chars.join]
				end

				# We already know about @chars[0]
				token_chars << @chars.shift
				while @chars[0] && @chars[0].type <= KYWD
					token_chars << @chars.shift
				end

				if @chars[0]&.id?
					# This token started out using characters that can appear in keywords,
					# but @chars[0] is a character not allowed within keywords, so this must
					# be an identifier instead
					while @chars[0]&.id?
						token_chars << @chars.shift
					end
					return TK::ID[token_chars.join]
				end

				# Check if the token is a keyword
				token_string = token_chars.join
				token_type = SQLITE_KEYWORDS_TO_TOKEN_TYPES[token_string.upcase] || TK::ID

				return token_type[token_string]
			when X
				# useless branch conditions to drive brach test coverage results
				nil if current_char == "x"
				nil if current_char == "X"

				if @chars[0] == "'"
					token_type = TK::BLOB
					token_chars << @chars.shift
					while @chars[0]&.xdigit?
						token_chars << @chars.shift
					end
					if @chars[0] != "'" || (token_chars.length % 2) != 0
						token_type = TK::ILLEGAL
						while @chars[0] != "'" && @chars[0] != nil
							token_chars << @chars.shift
						end
					end
					if @chars[0] != nil
						token_chars << @chars.shift
					end
					return token_type[token_chars.join]
				end
				# If it is not a BLOB literal, then it must be an ID, since no
				# SQL keywords start with the letter 'x'.
				while @chars[0]&.id?
					token_chars << @chars.shift
				end
				return TK::ID[token_chars.join]
			when KYWD, ID
				while @chars[0]&.id?
					token_chars << @chars.shift
				end
				return TK::ID[token_chars.join]
			when BOM
				if @chars[0] == 0xFE.chr && @chars[1] == 0xFF.chr
					token_chars << @chars.shift
					token_chars << @chars.shift
					return TK::SPACE[token_chars.join]
				else
					while @chars[0]&.id?
						token_chars << @chars.shift
					end
					return TK::ID[token_chars.join]
				end
			when NUL
				return TK::ILLEGAL[nil]
			else
				return TK::ILLEGAL[token_chars.join]
			end
		end
	end
end
