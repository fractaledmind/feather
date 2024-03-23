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
				str = '`abc`'
				assert_equal [Feather::TK::ID[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes tick wrapped string with escaped inner tick as ID" do
				str = '`abc``def`'
				assert_equal [Feather::TK::ID[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes single tick as ILLEGAL" do
				str = '`'
				assert_equal [Feather::TK::ILLEGAL[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes square bracket wrapped string as ID" do
				str = '[abc]'
				assert_equal [Feather::TK::ID[str]], Feather::Lexer.new(str).tokenize
			end
			it "tokenizes square bracket wrapped string with missing closing bracket as ILLEGAL" do
				str = '[abc'
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
	end
end
