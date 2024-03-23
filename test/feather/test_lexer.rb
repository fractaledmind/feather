# encoding: ASCII-8BIT
# frozen_string_literal: false

require "test_helper"

describe Feather::Lexer do
	describe "individual token types" do
		it "tokenizes a space as SPACE" do
			str = " "
			assert_equal [Feather::TK::SPACE[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes a tab as SPACE" do
			str = "\t"
			assert_equal [Feather::TK::SPACE[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes a newline as SPACE" do
			str = "\n"
			assert_equal [Feather::TK::SPACE[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes a form feed as SPACE" do
			str = "\f"
			assert_equal [Feather::TK::SPACE[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes a carriage return as SPACE" do
			str = "\r"
			assert_equal [Feather::TK::SPACE[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes a continuous string of mixed whitespace stracters as SPACE" do
			str = " \t\n\f\r"
			assert_equal [Feather::TK::SPACE[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes a minus sign as MINUS" do
			str = "-"
			assert_equal [Feather::TK::MINUS[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes a double dash sign as a comment SPACE" do
			str = "--"
			assert_equal [Feather::TK::SPACE[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes -> as PTR (pointer)" do
			str = "->"
			assert_equal [Feather::TK::PTR[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes ->> as PRT (pointer)" do
			str = "->>"
			assert_equal [Feather::TK::PTR[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes a full inline comment as SPACE" do
			str = "-- inline comment"
			assert_equal [Feather::TK::SPACE[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes ( as LP" do
			str = "("
			assert_equal [Feather::TK::LP[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes ) as RP" do
			str = ")"
			assert_equal [Feather::TK::RP[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes ; as SEMI" do
			str = ";"
			assert_equal [Feather::TK::SEMI[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes + as PLUS" do
			str = "+"
			assert_equal [Feather::TK::PLUS[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes * as STAR" do
			str = "*"
			assert_equal [Feather::TK::STAR[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes % as REM" do
			str = "%"
			assert_equal [Feather::TK::REM[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes , as COMMA" do
			str = ","
			assert_equal [Feather::TK::COMMA[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes & as BITAND" do
			str = "&"
			assert_equal [Feather::TK::BITAND[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes ~ as BITNOT" do
			str = "~"
			assert_equal [Feather::TK::BITNOT[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes = as EQ" do
			str = "="
			assert_equal [Feather::TK::EQ[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes == as EQ" do
			str = "=="
			assert_equal [Feather::TK::EQ[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes . as DOT" do
			str = "."
			assert_equal [Feather::TK::DOT[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes / as SLASH" do
			str = "/"
			assert_equal [Feather::TK::SLASH[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes a single line wrapped comment as SPACE" do
			str = "/* single line comment */"
			assert_equal [Feather::TK::SPACE[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes a multi-line wrapped comment as SPACE" do
			str = "/* multi-line\ncomment */"
			assert_equal [Feather::TK::SPACE[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes < as LT" do
			str = "<"
			assert_equal [Feather::TK::LT[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes <= as LE" do
			str = "<="
			assert_equal [Feather::TK::LE[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes <> as NE" do
			str = "<>"
			assert_equal [Feather::TK::NE[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes << as LSHIFT" do
			str = "<<"
			assert_equal [Feather::TK::LSHIFT[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes > as GT" do
			str = ">"
			assert_equal [Feather::TK::GT[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes >= as GE" do
			str = ">="
			assert_equal [Feather::TK::GE[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes >> as RSHIFT" do
			str = ">>"
			assert_equal [Feather::TK::RSHIFT[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes != as NE" do
			str = "!="
			assert_equal [Feather::TK::NE[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes | as BITOR" do
			str = "|"
			assert_equal [Feather::TK::BITOR[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes || as CONCAT" do
			str = "||"
			assert_equal [Feather::TK::CONCAT[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes single quote wrapped strings as STRING" do
			str = "'abc'"
			assert_equal [Feather::TK::STRING[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes single quote wrapped strings with escaped inner single quote as STRING" do
			str = "'abc''def'"
			assert_equal [Feather::TK::STRING[str]], Feather::Lexer.new(str).tokenize
		end
		it "tokenizes a \xEF\xFE\xFF BOM as SPACE" do
			str = "\xEF\xFE\xFF"
			assert_equal [Feather::TK::SPACE[str]], Feather::Lexer.new(str).tokenize
		end
		describe "ASCII control codes" do
			it "tokenizes the ASCII Null (NUL) character as ILLEGAL" do
				str = "\x00"
				assert_equal [Feather::TK::ILLEGAL[nil]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Start of Heading (SOH) character as ILLEGAL" do
				str = "\x01"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Start of Text (STX) character as ILLEGAL" do
				str = "\x02"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII End of Text (ETX) character as ILLEGAL" do
				str = "\x03"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII End of Transmission (EOT) character as ILLEGAL" do
				str = "\x04"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Enquiry (ENQ) character as ILLEGAL" do
				str = "\x05"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Acknowledge (ACK) character as ILLEGAL" do
				str = "\x06"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Bell (BEL) character as ILLEGAL" do
				str = "\x07"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Backspace (BS) character as ILLEGAL" do
				str = "\x08"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Horizontal Tab (HT) character as SPACE" do
				str = "\x09"
				assert_equal [Feather::TK::SPACE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Line Feed (LF) character as SPACE" do
				str = "\x0A"
				assert_equal [Feather::TK::SPACE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Vertical Tab (VT) character as ILLEGAL" do
				str = "\x0B"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Form Feed (FF) character as SPACE" do
				str = "\x0C"
				assert_equal [Feather::TK::SPACE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Carriage Return (CR) character as SPACE" do
				str = "\x0D"
				assert_equal [Feather::TK::SPACE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Shift Out (SO) character as ILLEGAL" do
				str = "\x0E"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Shift In (SI) character as ILLEGAL" do
				str = "\x0F"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Data Link Escape (DLE) character as ILLEGAL" do
				str = "\x10"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Device Control 1 (DC1) character as ILLEGAL" do
				str = "\x11"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Device Control 2 (DC2) character as ILLEGAL" do
				str = "\x12"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Device Control 3 (DC3) character as ILLEGAL" do
				str = "\x13"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Device Control 4 (DC4) character as ILLEGAL" do
				str = "\x14"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Negative Acknowledge (NAK) character as ILLEGAL" do
				str = "\x15"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Synchronous Idle (SYN) character as ILLEGAL" do
				str = "\x16"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII End of Transmission Block (ETB) character as ILLEGAL" do
				str = "\x17"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Cancel (CAN) character as ILLEGAL" do
				str = "\x18"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII End of Medium (EM) character as ILLEGAL" do
				str = "\x19"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Substitute (SUB) character as ILLEGAL" do
				str = "\x1A"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Escape (ESC) character as ILLEGAL" do
				str = "\x1B"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII File Separator (FS) character as ILLEGAL" do
				str = "\x1C"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Group Separator (GS) character as ILLEGAL" do
				str = "\x1D"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Record Separator (RS) character as ILLEGAL" do
				str = "\x1E"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes the ASCII Unit Separator (US) character as ILLEGAL" do
				str = "\x1F"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
		end
		describe "identifiers" do
			it "tokenizes a single letter as ID" do
				str = "a"
				assert_equal [Feather::TK::ID[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes a single letter followed by a number as ID" do
				str = "a1"
				assert_equal [Feather::TK::ID[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes double quote wrapped string as ID" do
				str = '"abc"'
				assert_equal [Feather::TK::ID[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes double quote wrapped string with escaped inner double quote as ID" do
				str = '"abc""def"'
				assert_equal [Feather::TK::ID[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes single double quote as ILLEGAL" do
				str = '"'
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes tick wrapped string as ID" do
				str = "`abc`"
				assert_equal [Feather::TK::ID[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes tick wrapped string with escaped inner tick as ID" do
				str = "`abc``def`"
				assert_equal [Feather::TK::ID[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes single tick as ILLEGAL" do
				str = "`"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes square bracket wrapped string as ID" do
				str = "[abc]"
				assert_equal [Feather::TK::ID[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes square bracket wrapped string with missing closing bracket as ILLEGAL" do
				str = "[abc"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes unassigned ASCII code points as ID" do
				str = "\x80"
				assert_equal [Feather::TK::ID[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes string of unassigned code points as ID" do
				str = "\x80\x81\x82"
				assert_equal [Feather::TK::ID[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes letter followed by $ as ID" do
				str = "a$"
				assert_equal [Feather::TK::ID[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes letter followed by _ as ID" do
				str = "a_"
				assert_equal [Feather::TK::ID[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes letters followed by $ as ID" do
				str = "abc$"
				assert_equal [Feather::TK::ID[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes letters followed by _ as ID" do
				str = "abc_"
				assert_equal [Feather::TK::ID[str]], Feather::Lexer.new(str).tokenize
			end
		end
		describe "numerics" do
			it "tokenizes a single digit as INTEGER" do
				str = "0"
				assert_equal [Feather::TK::INTEGER[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes multiple digits as INTEGER" do
				str = "123"
				assert_equal [Feather::TK::INTEGER[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes 0x?? as INTEGER" do
				str = "0xFF"
				assert_equal [Feather::TK::INTEGER[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes 0X?? as INTEGER" do
				str = "0XFF"
				assert_equal [Feather::TK::INTEGER[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes 0x?????? as INTEGER" do
				str = "0x1234FF"
				assert_equal [Feather::TK::INTEGER[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes 0X?????? as INTEGER" do
				str = "0X1234FF"
				assert_equal [Feather::TK::INTEGER[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes digits separated by a dot as FLOAT" do
				str = "123.456"
				assert_equal [Feather::TK::FLOAT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes digits separated by a dot with no leading digit as FLOAT" do
				str = ".456"
				assert_equal [Feather::TK::FLOAT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes digits separated by a dot with no trailing digit as FLOAT" do
				str = "123."
				assert_equal [Feather::TK::FLOAT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes digit followed by e and another digit as FLOAT" do
				str = "1e2"
				assert_equal [Feather::TK::FLOAT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes digits followed by e and more digits as FLOAT" do
				str = "123e456"
				assert_equal [Feather::TK::FLOAT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes digit followed by e+ and another digit as FLOAT" do
				str = "1e+2"
				assert_equal [Feather::TK::FLOAT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes digits followed by e+ and more digits as FLOAT" do
				str = "123e+456"
				assert_equal [Feather::TK::FLOAT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes digit followed by e- and another digit as FLOAT" do
				str = "1e-2"
				assert_equal [Feather::TK::FLOAT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes digits followed by e- and more digits as FLOAT" do
				str = "123e-456"
				assert_equal [Feather::TK::FLOAT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes digit followed by E and another digit as FLOAT" do
				str = "1E2"
				assert_equal [Feather::TK::FLOAT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes digits followed by E and more digits as FLOAT" do
				str = "123E456"
				assert_equal [Feather::TK::FLOAT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes digit followed by E+ and another digit as FLOAT" do
				str = "1E+2"
				assert_equal [Feather::TK::FLOAT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes digits followed by E+ and more digits as FLOAT" do
				str = "123E+456"
				assert_equal [Feather::TK::FLOAT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes digit followed by E- and another digit as FLOAT" do
				str = "1E-2"
				assert_equal [Feather::TK::FLOAT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes digits followed by E- and more digits as FLOAT" do
				str = "123E-456"
				assert_equal [Feather::TK::FLOAT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes digit followed by $ as ILLEGAL" do
				str = "1$"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
		end
		describe "variables" do
			it "tokenizes ? as VARIABLE" do
				str = "?"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes ? followed by digit as VARIABLE" do
				str = "?1"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes ? followed by digits as VARIABLE" do
				str = "?123"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes bare $ as ILLEGAL" do
				str = "$"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes $ followed by digit as VARIABLE" do
				str = "$1"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes $ followed by digits as VARIABLE" do
				str = "$123"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes $ followed by letter as VARIABLE" do
				str = "$a"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes $ followed by letters as VARIABLE" do
				str = "$abc"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes bare @ as ILLEGAL" do
				str = "@"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes @ followed by digit as VARIABLE" do
				str = "@1"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes @ followed by digits as VARIABLE" do
				str = "@123"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes @ followed by letter as VARIABLE" do
				str = "@a"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes @ followed by letters as VARIABLE" do
				str = "@abc"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes bare : as ILLEGAL" do
				str = ":"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes : followed by digit as VARIABLE" do
				str = ":1"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes : followed by digits as VARIABLE" do
				str = ":123"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes : followed by letter as VARIABLE" do
				str = ":a"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes : followed by letters as VARIABLE" do
				str = ":abc"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes bare # as ILLEGAL" do
				str = "#"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes # followed by digit as VARIABLE" do
				str = "#1"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes # followed by digits as VARIABLE" do
				str = "#123"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes # followed by letter as VARIABLE" do
				str = "#a"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes # followed by letters as VARIABLE" do
				str = "#abc"
				assert_equal [Feather::TK::VARIABLE[str]], Feather::Lexer.new(str).tokenize
			end
		end
		describe "blobs" do
			it "tokenizes x'' as BLOB" do
				str = "x''"
				assert_equal [Feather::TK::BLOB[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes x'' with even number of alphanumeric characters as BLOB" do
				str = "x'abcdEF12'"
				assert_equal [Feather::TK::BLOB[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes x'' with even number of symbols as ILLEGAL" do
				str = "x'abcdEF12$#'"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes x'' with odd number of alphanumeric characters as ILLEGAL" do
				str = "x'abcdEF123'"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes x' with missing closing single quote as ILLEGAL" do
				str = "x'"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes x' with even number of alphanumeric characters but missing closing single quote as ILLEGAL" do
				str = "x'abcdEF12"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes X'' as BLOB" do
				str = "X''"
				assert_equal [Feather::TK::BLOB[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes X'' with even number of alphanumeric characters as BLOB" do
				str = "X'abcdEF12'"
				assert_equal [Feather::TK::BLOB[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes X'' with even number of symbols as ILLEGAL" do
				str = "X'abcdEF12$#'"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes X'' with odd number of alphanumeric characters as ILLEGAL" do
				str = "X'abcdEF123'"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes X' with missing closing single quote as ILLEGAL" do
				str = "X'"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes X' with even number of alphanumeric characters but missing closing single quote as ILLEGAL" do
				str = "X'abcdEF12"
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
		end
		describe "keywords" do
			it "tokenizes ABORT as ABORT" do
				str = "ABORT"
				assert_equal [Feather::TK::ABORT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes ACTION as ACTION" do
				str = "ACTION"
				assert_equal [Feather::TK::ACTION[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes ADD as ADD" do
				str = "ADD"
				assert_equal [Feather::TK::ADD[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes AFTER as AFTER" do
				str = "AFTER"
				assert_equal [Feather::TK::AFTER[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes ALL as ALL" do
				str = "ALL"
				assert_equal [Feather::TK::ALL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes ALTER as ALTER" do
				str = "ALTER"
				assert_equal [Feather::TK::ALTER[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes ALWAYS as ALWAYS" do
				str = "ALWAYS"
				assert_equal [Feather::TK::ALWAYS[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes ANALYZE as ANALYZE" do
				str = "ANALYZE"
				assert_equal [Feather::TK::ANALYZE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes AND as AND" do
				str = "AND"
				assert_equal [Feather::TK::AND[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes AS as AS" do
				str = "AS"
				assert_equal [Feather::TK::AS[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes ASC as ASC" do
				str = "ASC"
				assert_equal [Feather::TK::ASC[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes ATTACH as ATTACH" do
				str = "ATTACH"
				assert_equal [Feather::TK::ATTACH[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes AUTOINCREMENT as AUTOINCR" do
				str = "AUTOINCREMENT"
				assert_equal [Feather::TK::AUTOINCR[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes BEFORE as BEFORE" do
				str = "BEFORE"
				assert_equal [Feather::TK::BEFORE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes BEGIN as BEGIN" do
				str = "BEGIN"
				assert_equal [Feather::TK::BEGIN[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes BETWEEN as BETWEEN" do
				str = "BETWEEN"
				assert_equal [Feather::TK::BETWEEN[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes BY as BY" do
				str = "BY"
				assert_equal [Feather::TK::BY[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes CASCADE as CASCADE" do
				str = "CASCADE"
				assert_equal [Feather::TK::CASCADE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes CASE as CASE" do
				str = "CASE"
				assert_equal [Feather::TK::CASE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes CAST as CAST" do
				str = "CAST"
				assert_equal [Feather::TK::CAST[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes CHECK as CHECK" do
				str = "CHECK"
				assert_equal [Feather::TK::CHECK[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes COLLATE as COLLATE" do
				str = "COLLATE"
				assert_equal [Feather::TK::COLLATE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes COLUMN as COLUMNKW" do
				str = "COLUMN"
				assert_equal [Feather::TK::COLUMNKW[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes COMMIT as COMMIT" do
				str = "COMMIT"
				assert_equal [Feather::TK::COMMIT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes CONFLICT as CONFLICT" do
				str = "CONFLICT"
				assert_equal [Feather::TK::CONFLICT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes CONSTRAINT as CONSTRAINT" do
				str = "CONSTRAINT"
				assert_equal [Feather::TK::CONSTRAINT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes CREATE as CREATE" do
				str = "CREATE"
				assert_equal [Feather::TK::CREATE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes CROSS as JOIN_KW" do
				str = "CROSS"
				assert_equal [Feather::TK::JOIN_KW[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes CURRENT as CURRENT" do
				str = "CURRENT"
				assert_equal [Feather::TK::CURRENT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes CURRENT_DATE as CTIME_KW" do
				str = "CURRENT_DATE"
				assert_equal [Feather::TK::CTIME_KW[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes CURRENT_TIME as CTIME_KW" do
				str = "CURRENT_TIME"
				assert_equal [Feather::TK::CTIME_KW[str]], Feather::Lexer.new(str).tokenize
			end

			it "tokenizes CURRENT_TIMESTAMP as CTIME_KW" do
				str = "CURRENT_TIMESTAMP"
				assert_equal [Feather::TK::CTIME_KW[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes DATABASE as DATABASE" do
				str = "DATABASE"
				assert_equal [Feather::TK::DATABASE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes DEFAULT as DEFAULT" do
				str = "DEFAULT"
				assert_equal [Feather::TK::DEFAULT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes DEFERRED as DEFERRED" do
				str = "DEFERRED"
				assert_equal [Feather::TK::DEFERRED[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes DEFERRABLE as DEFERRABLE" do
				str = "DEFERRABLE"
				assert_equal [Feather::TK::DEFERRABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes DELETE as DELETE" do
				str = "DELETE"
				assert_equal [Feather::TK::DELETE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes DESC as DESC" do
				str = "DESC"
				assert_equal [Feather::TK::DESC[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes DETACH as DETACH" do
				str = "DETACH"
				assert_equal [Feather::TK::DETACH[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes DISTINCT as DISTINCT" do
				str = "DISTINCT"
				assert_equal [Feather::TK::DISTINCT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes DO as DO" do
				str = "DO"
				assert_equal [Feather::TK::DO[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes DROP as DROP" do
				str = "DROP"
				assert_equal [Feather::TK::DROP[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes END as END" do
				str = "END"
				assert_equal [Feather::TK::END[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes EACH as EACH" do
				str = "EACH"
				assert_equal [Feather::TK::EACH[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes ELSE as ELSE" do
				str = "ELSE"
				assert_equal [Feather::TK::ELSE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes ESCAPE as ESCAPE" do
				str = "ESCAPE"
				assert_equal [Feather::TK::ESCAPE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes EXCEPT as EXCEPT" do
				str = "EXCEPT"
				assert_equal [Feather::TK::EXCEPT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes EXCLUSIVE as EXCLUSIVE" do
				str = "EXCLUSIVE"
				assert_equal [Feather::TK::EXCLUSIVE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes EXCLUDE as EXCLUDE" do
				str = "EXCLUDE"
				assert_equal [Feather::TK::EXCLUDE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes EXISTS as EXISTS" do
				str = "EXISTS"
				assert_equal [Feather::TK::EXISTS[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes EXPLAIN as EXPLAIN" do
				str = "EXPLAIN"
				assert_equal [Feather::TK::EXPLAIN[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes FAIL as FAIL" do
				str = "FAIL"
				assert_equal [Feather::TK::FAIL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes FILTER as FILTER" do
				str = "FILTER"
				assert_equal [Feather::TK::FILTER[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes FIRST as FIRST" do
				str = "FIRST"
				assert_equal [Feather::TK::FIRST[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes FOLLOWING as FOLLOWING" do
				str = "FOLLOWING"
				assert_equal [Feather::TK::FOLLOWING[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes FOR as FOR" do
				str = "FOR"
				assert_equal [Feather::TK::FOR[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes FOREIGN as FOREIGN" do
				str = "FOREIGN"
				assert_equal [Feather::TK::FOREIGN[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes FROM as FROM" do
				str = "FROM"
				assert_equal [Feather::TK::FROM[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes FULL as JOIN_KW" do
				str = "FULL"
				assert_equal [Feather::TK::JOIN_KW[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes GENERATED as GENERATED" do
				str = "GENERATED"
				assert_equal [Feather::TK::GENERATED[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes GLOB as LIKE_KW" do
				str = "GLOB"
				assert_equal [Feather::TK::LIKE_KW[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes GROUP as GROUP" do
				str = "GROUP"
				assert_equal [Feather::TK::GROUP[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes GROUPS as GROUPS" do
				str = "GROUPS"
				assert_equal [Feather::TK::GROUPS[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes HAVING as HAVING" do
				str = "HAVING"
				assert_equal [Feather::TK::HAVING[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes IF as IF" do
				str = "IF"
				assert_equal [Feather::TK::IF[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes IGNORE as IGNORE" do
				str = "IGNORE"
				assert_equal [Feather::TK::IGNORE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes IMMEDIATE as IMMEDIATE" do
				str = "IMMEDIATE"
				assert_equal [Feather::TK::IMMEDIATE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes IN as IN" do
				str = "IN"
				assert_equal [Feather::TK::IN[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes INDEX as INDEX" do
				str = "INDEX"
				assert_equal [Feather::TK::INDEX[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes INDEXED as INDEXED" do
				str = "INDEXED"
				assert_equal [Feather::TK::INDEXED[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes INITIALLY as INITIALLY" do
				str = "INITIALLY"
				assert_equal [Feather::TK::INITIALLY[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes INNER as JOIN_KW" do
				str = "INNER"
				assert_equal [Feather::TK::JOIN_KW[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes INSERT as INSERT" do
				str = "INSERT"
				assert_equal [Feather::TK::INSERT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes INSTEAD as INSTEAD" do
				str = "INSTEAD"
				assert_equal [Feather::TK::INSTEAD[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes INTERSECT as INTERSECT" do
				str = "INTERSECT"
				assert_equal [Feather::TK::INTERSECT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes INTO as INTO" do
				str = "INTO"
				assert_equal [Feather::TK::INTO[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes IS as IS" do
				str = "IS"
				assert_equal [Feather::TK::IS[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes ISNULL as ISNULL" do
				str = "ISNULL"
				assert_equal [Feather::TK::ISNULL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes JOIN as JOIN" do
				str = "JOIN"
				assert_equal [Feather::TK::JOIN[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes KEY as KEY" do
				str = "KEY"
				assert_equal [Feather::TK::KEY[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes LAST as LAST" do
				str = "LAST"
				assert_equal [Feather::TK::LAST[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes LEFT as JOIN_KW" do
				str = "LEFT"
				assert_equal [Feather::TK::JOIN_KW[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes LIKE as LIKE_KW" do
				str = "LIKE"
				assert_equal [Feather::TK::LIKE_KW[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes LIMIT as LIMIT" do
				str = "LIMIT"
				assert_equal [Feather::TK::LIMIT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes MATCH as MATCH" do
				str = "MATCH"
				assert_equal [Feather::TK::MATCH[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes MATERIALIZED as MATERIALIZED" do
				str = "MATERIALIZED"
				assert_equal [Feather::TK::MATERIALIZED[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes NATURAL as JOIN_KW" do
				str = "NATURAL"
				assert_equal [Feather::TK::JOIN_KW[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes NO as NO" do
				str = "NO"
				assert_equal [Feather::TK::NO[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes NOT as NOT" do
				str = "NOT"
				assert_equal [Feather::TK::NOT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes NOTHING as NOTHING" do
				str = "NOTHING"
				assert_equal [Feather::TK::NOTHING[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes NOTNULL as NOTNULL" do
				str = "NOTNULL"
				assert_equal [Feather::TK::NOTNULL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes NULL as NULL" do
				str = "NULL"
				assert_equal [Feather::TK::NULL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes NULLS as NULLS" do
				str = "NULLS"
				assert_equal [Feather::TK::NULLS[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes OF as OF" do
				str = "OF"
				assert_equal [Feather::TK::OF[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes OFFSET as OFFSET" do
				str = "OFFSET"
				assert_equal [Feather::TK::OFFSET[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes ON as ON" do
				str = "ON"
				assert_equal [Feather::TK::ON[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes OR as OR" do
				str = "OR"
				assert_equal [Feather::TK::OR[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes ORDER as ORDER" do
				str = "ORDER"
				assert_equal [Feather::TK::ORDER[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes OTHERS as OTHERS" do
				str = "OTHERS"
				assert_equal [Feather::TK::OTHERS[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes OUTER as JOIN_KW" do
				str = "OUTER"
				assert_equal [Feather::TK::JOIN_KW[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes OVER as OVER" do
				str = "OVER"
				assert_equal [Feather::TK::OVER[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes PARTITION as PARTITION" do
				str = "PARTITION"
				assert_equal [Feather::TK::PARTITION[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes PLAN as PLAN" do
				str = "PLAN"
				assert_equal [Feather::TK::PLAN[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes PRAGMA as PRAGMA" do
				str = "PRAGMA"
				assert_equal [Feather::TK::PRAGMA[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes PRECEDING as PRECEDING" do
				str = "PRECEDING"
				assert_equal [Feather::TK::PRECEDING[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes PRIMARY as PRIMARY" do
				str = "PRIMARY"
				assert_equal [Feather::TK::PRIMARY[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes QUERY as QUERY" do
				str = "QUERY"
				assert_equal [Feather::TK::QUERY[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes RAISE as RAISE" do
				str = "RAISE"
				assert_equal [Feather::TK::RAISE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes RANGE as RANGE" do
				str = "RANGE"
				assert_equal [Feather::TK::RANGE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes RECURSIVE as RECURSIVE" do
				str = "RECURSIVE"
				assert_equal [Feather::TK::RECURSIVE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes REFERENCES as REFERENCES" do
				str = "REFERENCES"
				assert_equal [Feather::TK::REFERENCES[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes REGEXP as LIKE_KW" do
				str = "REGEXP"
				assert_equal [Feather::TK::LIKE_KW[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes REINDEX as REINDEX" do
				str = "REINDEX"
				assert_equal [Feather::TK::REINDEX[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes RELEASE as RELEASE" do
				str = "RELEASE"
				assert_equal [Feather::TK::RELEASE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes RENAME as RENAME" do
				str = "RENAME"
				assert_equal [Feather::TK::RENAME[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes REPLACE as REPLACE" do
				str = "REPLACE"
				assert_equal [Feather::TK::REPLACE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes RESTRICT as RESTRICT" do
				str = "RESTRICT"
				assert_equal [Feather::TK::RESTRICT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes RETURNING as RETURNING" do
				str = "RETURNING"
				assert_equal [Feather::TK::RETURNING[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes RIGHT as JOIN_KW" do
				str = "RIGHT"
				assert_equal [Feather::TK::JOIN_KW[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes ROLLBACK as ROLLBACK" do
				str = "ROLLBACK"
				assert_equal [Feather::TK::ROLLBACK[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes ROW as ROW" do
				str = "ROW"
				assert_equal [Feather::TK::ROW[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes ROWS as ROWS" do
				str = "ROWS"
				assert_equal [Feather::TK::ROWS[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes SAVEPOINT as SAVEPOINT" do
				str = "SAVEPOINT"
				assert_equal [Feather::TK::SAVEPOINT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes SELECT as SELECT" do
				str = "SELECT"
				assert_equal [Feather::TK::SELECT[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes SET as SET" do
				str = "SET"
				assert_equal [Feather::TK::SET[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes TABLE as TABLE" do
				str = "TABLE"
				assert_equal [Feather::TK::TABLE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes TEMP as TEMP" do
				str = "TEMP"
				assert_equal [Feather::TK::TEMP[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes TEMPORARY as TEMP" do
				str = "TEMPORARY"
				assert_equal [Feather::TK::TEMP[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes THEN as THEN" do
				str = "THEN"
				assert_equal [Feather::TK::THEN[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes TIES as TIES" do
				str = "TIES"
				assert_equal [Feather::TK::TIES[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes TO as TO" do
				str = "TO"
				assert_equal [Feather::TK::TO[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes TRANSACTION as TRANSACTION" do
				str = "TRANSACTION"
				assert_equal [Feather::TK::TRANSACTION[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes TRIGGER as TRIGGER" do
				str = "TRIGGER"
				assert_equal [Feather::TK::TRIGGER[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes UNBOUNDED as UNBOUNDED" do
				str = "UNBOUNDED"
				assert_equal [Feather::TK::UNBOUNDED[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes UNION as UNION" do
				str = "UNION"
				assert_equal [Feather::TK::UNION[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes UNIQUE as UNIQUE" do
				str = "UNIQUE"
				assert_equal [Feather::TK::UNIQUE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes UPDATE as UPDATE" do
				str = "UPDATE"
				assert_equal [Feather::TK::UPDATE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes USING as USING" do
				str = "USING"
				assert_equal [Feather::TK::USING[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes VACUUM as VACUUM" do
				str = "VACUUM"
				assert_equal [Feather::TK::VACUUM[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes VALUES as VALUES" do
				str = "VALUES"
				assert_equal [Feather::TK::VALUES[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes VIEW as VIEW" do
				str = "VIEW"
				assert_equal [Feather::TK::VIEW[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes VIRTUAL as VIRTUAL" do
				str = "VIRTUAL"
				assert_equal [Feather::TK::VIRTUAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes WHEN as WHEN" do
				str = "WHEN"
				assert_equal [Feather::TK::WHEN[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes WHERE as WHERE" do
				str = "WHERE"
				assert_equal [Feather::TK::WHERE[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes WINDOW as WINDOW" do
				str = "WINDOW"
				assert_equal [Feather::TK::WINDOW[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes WITH as WITH" do
				str = "WITH"
				assert_equal [Feather::TK::WITH[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes WITHOUT as WITHOUT" do
				str = "WITHOUT"
				assert_equal [Feather::TK::WITHOUT[str]], Feather::Lexer.new(str).tokenize
			end
		end
	end

	describe "tokenizer.test" do
		it "tokenizes 1.0e+ as ILLEGAL" do
			assert_equal(
				[Feather::TK::ILLEGAL["1.0e"], Feather::TK::PLUS["+"]],
				Feather::Lexer.new("1.0e+").tokenize
			)
		end
		it "tokenizes 1.0E+ as ILLEGAL" do
			assert_equal(
				[Feather::TK::ILLEGAL["1.0E"], Feather::TK::PLUS["+"]],
				Feather::Lexer.new("1.0E+").tokenize
			)
		end
		it "tokenizes 1.0e- as ILLEGAL" do
			assert_equal(
				[Feather::TK::ILLEGAL["1.0e"], Feather::TK::MINUS["-"]],
				Feather::Lexer.new("1.0e-").tokenize
			)
		end
		it "tokenizes 1.0E- as ILLEGAL" do
			assert_equal(
				[Feather::TK::ILLEGAL["1.0E"], Feather::TK::MINUS["-"]],
				Feather::Lexer.new("1.0E-").tokenize
			)
		end
		it "tokenizes 1.0e+/ as ILLEGAL" do
			assert_equal(
				[Feather::TK::ILLEGAL["1.0e"], Feather::TK::PLUS["+"], Feather::TK::SLASH["/"]],
				Feather::Lexer.new("1.0e+/").tokenize
			)
		end
		it "tokenizes 1.0E+: as ILLEGAL" do
			assert_equal(
				[Feather::TK::ILLEGAL["1.0E"], Feather::TK::PLUS["+"], Feather::TK::ILLEGAL[":"]],
				Feather::Lexer.new("1.0E+:").tokenize
			)
		end
		it "tokenizes 1.0e-: as ILLEGAL" do
			assert_equal(
				[Feather::TK::ILLEGAL["1.0e"], Feather::TK::MINUS["-"], Feather::TK::ILLEGAL[":"]],
				Feather::Lexer.new("1.0e-:").tokenize
			)
		end
		it "tokenizes 1.0E-/ as ILLEGAL" do
			assert_equal(
				[Feather::TK::ILLEGAL["1.0E"], Feather::TK::MINUS["-"], Feather::TK::SLASH["/"]],
				Feather::Lexer.new("1.0E-/").tokenize
			)
		end
		it "tokenizes 1.0F+5 as ILLEGAL" do
			assert_equal(
				[Feather::TK::ILLEGAL["1.0F"], Feather::TK::PLUS["+"], Feather::TK::INTEGER["5"]],
				Feather::Lexer.new("1.0F+5").tokenize
			)
		end
		it "tokenizes 1.0d-10 as ILLEGAL" do
			assert_equal(
				[Feather::TK::ILLEGAL["1.0d"], Feather::TK::MINUS["-"], Feather::TK::INTEGER["10"]],
				Feather::Lexer.new("1.0d-10").tokenize
			)
		end
		it "tokenizes 1.0e,5 as ILLEGAL" do
			assert_equal(
				[Feather::TK::ILLEGAL["1.0e"], Feather::TK::COMMA[","], Feather::TK::INTEGER["5"]],
				Feather::Lexer.new("1.0e,5").tokenize
			)
		end
		it "tokenizes 1.0E.10 as ILLEGAL" do
			assert_equal(
				[Feather::TK::ILLEGAL["1.0E"], Feather::TK::FLOAT[".10"]],
				Feather::Lexer.new("1.0E.10").tokenize
			)
		end
		it "tokenizes 2 /* as ILLEGAL" do
			assert_equal(
				[Feather::TK::INTEGER["2"], Feather::TK::SPACE[" "], Feather::TK::SLASH["/"], Feather::TK::STAR["*"]],
				Feather::Lexer.new("2 /*").tokenize
			)
		end
		it "tokenizes 2 /*  as ILLEGAL" do
			assert_equal(
				[Feather::TK::INTEGER["2"], Feather::TK::SPACE[" "], Feather::TK::SPACE["/*"], Feather::TK::SPACE[" "]],
				Feather::Lexer.new("2 /* ").tokenize
			)
		end
	end
end
