# encoding: ASCII-8BIT
# frozen_string_literal: false

def assert_token(str, tk)
	tokens = Plume.tokenize(str)
	assert(tokens.length == 1) do
		"expected #{tokens.length} to == 1"
	end

	token = tokens.first
	assert(tk === token) do
		"expected #{tk.inspect} to === #{token.inspect}"
	end
end

include Plume

test "tokenizes a space as SPACE" do
	assert_token " ", TK::SPACE
end

test "tokenizes a tab as SPACE" do
	assert_token "\t", TK::SPACE
end

test "tokenizes a newline as SPACE" do
	assert_token "\n", TK::SPACE
end

test "tokenizes a form feed as SPACE" do
	assert_token "\f", TK::SPACE
end

test "tokenizes a carriage return as SPACE" do
	assert_token "\r", TK::SPACE
end

test "tokenizes a continuous string of mixed whitespace stracters as SPACE" do
	assert_token " \t\n\f\r", TK::SPACE
end

test "tokenizes a minus sign as MINUS" do
	assert_token "-", TK::MINUS
end

test "tokenizes a double dash sign as a comment SPACE" do
	assert_token "--", TK::SPACE
end

test "tokenizes -> as PTR (pointer)" do
	assert_token "->", TK::PTR
end

test "tokenizes ->> as PRT (pointer)" do
	assert_token "->>", TK::PTR
end

test "tokenizes a full inline comment as SPACE" do
	assert_token "-- inline comment", TK::SPACE
end

test "tokenizes ( as LP" do
	assert_token "(", TK::LP
end

test "tokenizes ) as RP" do
	assert_token ")", TK::RP
end

test "tokenizes ; as SEMI" do
	assert_token ";", TK::SEMI
end

test "tokenizes + as PLUS" do
	assert_token "+", TK::PLUS
end

test "tokenizes * as STAR" do
	assert_token "*", TK::STAR
end

test "tokenizes % as REM" do
	assert_token "%", TK::REM
end

test "tokenizes , as COMMA" do
	assert_token ",", TK::COMMA
end

test "tokenizes & as BITAND" do
	assert_token "&", TK::BITAND
end

test "tokenizes ~ as BITNOT" do
	assert_token "~", TK::BITNOT
end

test "tokenizes = as EQ" do
	assert_token "=", TK::EQ
end

test "tokenizes == as EQ" do
	assert_token "==", TK::EQ
end

test "tokenizes . as DOT" do
	assert_token ".", TK::DOT
end

test "tokenizes / as SLASH" do
	assert_token "/", TK::SLASH
end

test "tokenizes a single line wrapped comment as SPACE" do
	assert_token "/* single line comment */", TK::SPACE
end

test "tokenizes a multi-line wrapped comment as SPACE" do
	assert_token "/* multi-line\ncomment */", TK::SPACE
end

test "tokenizes < as LT" do
	assert_token "<", TK::LT
end

test "tokenizes <= as LE" do
	assert_token "<=", TK::LE
end

test "tokenizes <> as NE" do
	assert_token "<>", TK::NE
end

test "tokenizes << as LSHIFT" do
	assert_token "<<", TK::LSHIFT
end

test "tokenizes > as GT" do
	assert_token ">", TK::GT
end

test "tokenizes >= as GE" do
	assert_token ">=", TK::GE
end

test "tokenizes >> as RSHIFT" do
	assert_token ">>", TK::RSHIFT
end

test "tokenizes != as NE" do
	assert_token "!=", TK::NE
end

test "tokenizes | as BITOR" do
	assert_token "|", TK::BITOR
end

test "tokenizes || as CONCAT" do
	assert_token "||", TK::CONCAT
end

test "tokenizes single quote wrapped strings as STRING" do
	assert_token "'abc'", TK::STRING
end

test "tokenizes single quote wrapped strings with escaped inner single quote as STRING" do
	assert_token "'abc''def'", TK::STRING
end

test "tokenizes a \xEF\xFE\xFF BOM as SPACE" do
	assert_token "\xEF\xFE\xFF", TK::SPACE
end

# ASCII control codes

test "tokenizes the ASCII Null (NUL) character as ILLEGAL" do
	assert_token "\x00", TK::ILLEGAL
end

test "tokenizes the ASCII Start of Heading (SOH) character as ILLEGAL" do
	assert_token "\x01", TK::ILLEGAL
end

test "tokenizes the ASCII Start of Text (STX) character as ILLEGAL" do
	assert_token "\x02", TK::ILLEGAL
end

test "tokenizes the ASCII End of Text (ETX) character as ILLEGAL" do
	assert_token "\x03", TK::ILLEGAL
end

test "tokenizes the ASCII End of Transmission (EOT) character as ILLEGAL" do
	assert_token "\x04", TK::ILLEGAL
end

test "tokenizes the ASCII Enquiry (ENQ) character as ILLEGAL" do
	assert_token "\x05", TK::ILLEGAL
end

test "tokenizes the ASCII Acknowledge (ACK) character as ILLEGAL" do
	assert_token "\x06", TK::ILLEGAL
end

test "tokenizes the ASCII Bell (BEL) character as ILLEGAL" do
	assert_token "\x07", TK::ILLEGAL
end

test "tokenizes the ASCII Backspace (BS) character as ILLEGAL" do
	assert_token "\x08", TK::ILLEGAL
end

test "tokenizes the ASCII Horizontal Tab (HT) character as SPACE" do
	assert_token "\x09", TK::SPACE
end

test "tokenizes the ASCII Line Feed (LF) character as SPACE" do
	assert_token "\x0A", TK::SPACE
end

test "tokenizes the ASCII Vertical Tab (VT) character as ILLEGAL" do
	assert_token "\x0B", TK::ILLEGAL
end

test "tokenizes the ASCII Form Feed (FF) character as SPACE" do
	assert_token "\x0C", TK::SPACE
end

test "tokenizes the ASCII Carriage Return (CR) character as SPACE" do
	assert_token "\x0D", TK::SPACE
end

test "tokenizes the ASCII Shift Out (SO) character as ILLEGAL" do
	assert_token "\x0E", TK::ILLEGAL
end

test "tokenizes the ASCII Shift In (SI) character as ILLEGAL" do
	assert_token "\x0F", TK::ILLEGAL
end

test "tokenizes the ASCII Data Link Escape (DLE) character as ILLEGAL" do
	assert_token "\x10", TK::ILLEGAL
end

test "tokenizes the ASCII Device Control 1 (DC1) character as ILLEGAL" do
	assert_token "\x11", TK::ILLEGAL
end

test "tokenizes the ASCII Device Control 2 (DC2) character as ILLEGAL" do
	assert_token "\x12", TK::ILLEGAL
end

test "tokenizes the ASCII Device Control 3 (DC3) character as ILLEGAL" do
	assert_token "\x13", TK::ILLEGAL
end

test "tokenizes the ASCII Device Control 4 (DC4) character as ILLEGAL" do
	assert_token "\x14", TK::ILLEGAL
end

test "tokenizes the ASCII Negative Acknowledge (NAK) character as ILLEGAL" do
	assert_token "\x15", TK::ILLEGAL
end

test "tokenizes the ASCII Synchronous Idle (SYN) character as ILLEGAL" do
	assert_token "\x16", TK::ILLEGAL
end

test "tokenizes the ASCII End of Transmission Block (ETB) character as ILLEGAL" do
	assert_token "\x17", TK::ILLEGAL
end

test "tokenizes the ASCII Cancel (CAN) character as ILLEGAL" do
	assert_token "\x18", TK::ILLEGAL
end

test "tokenizes the ASCII End of Medium (EM) character as ILLEGAL" do
	assert_token "\x19", TK::ILLEGAL
end

test "tokenizes the ASCII Substitute (SUB) character as ILLEGAL" do
	assert_token "\x1A", TK::ILLEGAL
end

test "tokenizes the ASCII Escape (ESC) character as ILLEGAL" do
	assert_token "\x1B", TK::ILLEGAL
end

test "tokenizes the ASCII File Separator (FS) character as ILLEGAL" do
	assert_token "\x1C", TK::ILLEGAL
end

test "tokenizes the ASCII Group Separator (GS) character as ILLEGAL" do
	assert_token "\x1D", TK::ILLEGAL
end

test "tokenizes the ASCII Record Separator (RS) character as ILLEGAL" do
	assert_token "\x1E", TK::ILLEGAL
end

test "tokenizes the ASCII Unit Separator (US) character as ILLEGAL" do
	assert_token "\x1F", TK::ILLEGAL
end

# identifiers

test "tokenizes a single letter as ID" do
	assert_token "a", TK::ID
end

test "tokenizes a single letter followed by a number as ID" do
	assert_token "a1", TK::ID
end

test "tokenizes double quote wrapped string as ID" do
	assert_token '"abc"', TK::ID
end

test "tokenizes double quote wrapped string with escaped inner double quote as ID" do
	assert_token '"abc""def"', TK::ID
end

test "tokenizes single double quote as ILLEGAL" do
	assert_token '"', TK::ILLEGAL
end

test "tokenizes tick wrapped string as ID" do
	assert_token "`abc`", TK::ID
end

test "tokenizes tick wrapped string with escaped inner tick as ID" do
	assert_token "`abc``def`", TK::ID
end

test "tokenizes single tick as ILLEGAL" do
	assert_token "`", TK::ILLEGAL
end

test "tokenizes square bracket wrapped string as ID" do
	assert_token "[abc]", TK::ID
end

test "tokenizes square bracket wrapped string with missing closing bracket as ILLEGAL" do
	assert_token "[abc", TK::ILLEGAL
end

test "tokenizes unassigned ASCII code points as ID" do
	assert_token "\x80", TK::ID
end

test "tokenizes string of unassigned code points as ID" do
	assert_token "\x80\x81\x82", TK::ID
end

test "tokenizes letter followed by $ as ID" do
	assert_token "a$", TK::ID
end

test "tokenizes letter followed by _ as ID" do
	assert_token "a_", TK::ID
end

test "tokenizes letters followed by $ as ID" do
	assert_token "abc$", TK::ID
end

test "tokenizes letters followed by _ as ID" do
	assert_token "abc_", TK::ID
end

# numerics

test "tokenizes a single digit as INTEGER" do
	assert_token "0", TK::INTEGER
end

test "tokenizes multiple digits as INTEGER" do
	assert_token "123", TK::INTEGER
end

test "tokenizes 0x?? as INTEGER" do
	assert_token "0xFF", TK::INTEGER
end

test "tokenizes 0X?? as INTEGER" do
	assert_token "0XFF", TK::INTEGER
end

test "tokenizes 0x?????? as INTEGER" do
	assert_token "0x1234FF", TK::INTEGER
end

test "tokenizes 0X?????? as INTEGER" do
	assert_token "0X1234FF", TK::INTEGER
end

test "tokenizes digits separated by a dot as FLOAT" do
	assert_token "123.456", TK::FLOAT
end

test "tokenizes digits separated by a dot with no leading digit as FLOAT" do
	assert_token ".456", TK::FLOAT
end

test "tokenizes digits separated by a dot with no trailing digit as FLOAT" do
	assert_token "123.", TK::FLOAT
end

test "tokenizes digit followed by e and another digit as FLOAT" do
	assert_token "1e2", TK::FLOAT
end

test "tokenizes digits followed by e and more digits as FLOAT" do
	assert_token "123e456", TK::FLOAT
end

test "tokenizes digit followed by e+ and another digit as FLOAT" do
	assert_token "1e+2", TK::FLOAT
end

test "tokenizes digits followed by e+ and more digits as FLOAT" do
	assert_token "123e+456", TK::FLOAT
end

test "tokenizes digit followed by e- and another digit as FLOAT" do
	assert_token "1e-2", TK::FLOAT
end

test "tokenizes digits followed by e- and more digits as FLOAT" do
	assert_token "123e-456", TK::FLOAT
end

test "tokenizes digit followed by E and another digit as FLOAT" do
	assert_token "1E2", TK::FLOAT
end

test "tokenizes digits followed by E and more digits as FLOAT" do
	assert_token "123E456", TK::FLOAT
end

test "tokenizes digit followed by E+ and another digit as FLOAT" do
	assert_token "1E+2", TK::FLOAT
end

test "tokenizes digits followed by E+ and more digits as FLOAT" do
	assert_token "123E+456", TK::FLOAT
end

test "tokenizes digit followed by E- and another digit as FLOAT" do
	assert_token "1E-2", TK::FLOAT
end

test "tokenizes digits followed by E- and more digits as FLOAT" do
	assert_token "123E-456", TK::FLOAT
end

test "tokenizes digit followed by $ as ILLEGAL" do
	assert_token "1$", TK::ILLEGAL
end

# variables

test "tokenizes ? as VARIABLE" do
	assert_token "?", TK::VARIABLE
end

test "tokenizes ? followed by digit as VARIABLE" do
	assert_token "?1", TK::VARIABLE
end

test "tokenizes ? followed by digits as VARIABLE" do
	assert_token "?123", TK::VARIABLE
end

test "tokenizes bare $ as ILLEGAL" do
	assert_token "$", TK::ILLEGAL
end

test "tokenizes $ followed by digit as VARIABLE" do
	assert_token "$1", TK::VARIABLE
end

test "tokenizes $ followed by digits as VARIABLE" do
	assert_token "$123", TK::VARIABLE
end

test "tokenizes $ followed by letter as VARIABLE" do
	assert_token "$a", TK::VARIABLE
end

test "tokenizes $ followed by letters as VARIABLE" do
	assert_token "$abc", TK::VARIABLE
end

test "tokenizes bare @ as ILLEGAL" do
	assert_token "@", TK::ILLEGAL
end

test "tokenizes @ followed by digit as VARIABLE" do
	assert_token "@1", TK::VARIABLE
end

test "tokenizes @ followed by digits as VARIABLE" do
	assert_token "@123", TK::VARIABLE
end

test "tokenizes @ followed by letter as VARIABLE" do
	assert_token "@a", TK::VARIABLE
end

test "tokenizes @ followed by letters as VARIABLE" do
	assert_token "@abc", TK::VARIABLE
end

test "tokenizes bare : as ILLEGAL" do
	assert_token ":", TK::ILLEGAL
end

test "tokenizes : followed by digit as VARIABLE" do
	assert_token ":1", TK::VARIABLE
end

test "tokenizes : followed by digits as VARIABLE" do
	assert_token ":123", TK::VARIABLE
end

test "tokenizes : followed by letter as VARIABLE" do
	assert_token ":a", TK::VARIABLE
end

test "tokenizes : followed by letters as VARIABLE" do
	assert_token ":abc", TK::VARIABLE
end

test "tokenizes bare # as ILLEGAL" do
	assert_token "#", TK::ILLEGAL
end

test "tokenizes # followed by digit as VARIABLE" do
	assert_token "#1", TK::VARIABLE
end

test "tokenizes # followed by digits as VARIABLE" do
	assert_token "#123", TK::VARIABLE
end

test "tokenizes # followed by letter as VARIABLE" do
	assert_token "#a", TK::VARIABLE
end

test "tokenizes # followed by letters as VARIABLE" do
	assert_token "#abc", TK::VARIABLE
end

# blobs

test "tokenizes x'' as BLOB" do
	assert_token "x''", TK::BLOB
end

test "tokenizes x'' with even number of alphanumeric characters as BLOB" do
	assert_token "x'abcdEF12'", TK::BLOB
end

test "tokenizes x'' with even number of symbols as ILLEGAL" do
	assert_token "x'abcdEF12$#'", TK::ILLEGAL
end

test "tokenizes x'' with odd number of alphanumeric characters as ILLEGAL" do
	assert_token "x'abcdEF123'", TK::ILLEGAL
end

test "tokenizes x' with missing closing single quote as ILLEGAL" do
	assert_token "x'", TK::ILLEGAL
end

test "tokenizes x' with even number of alphanumeric characters but missing closing single quote as ILLEGAL" do
	assert_token "x'abcdEF12", TK::ILLEGAL
end

test "tokenizes X'' as BLOB" do
	assert_token "X''", TK::BLOB
end

test "tokenizes X'' with even number of alphanumeric characters as BLOB" do
	assert_token "X'abcdEF12'", TK::BLOB
end

test "tokenizes X'' with even number of symbols as ILLEGAL" do
	assert_token "X'abcdEF12$#'", TK::ILLEGAL
end

test "tokenizes X'' with odd number of alphanumeric characters as ILLEGAL" do
	assert_token "X'abcdEF123'", TK::ILLEGAL
end

test "tokenizes X' with missing closing single quote as ILLEGAL" do
	assert_token "X'", TK::ILLEGAL
end

test "tokenizes X' with even number of alphanumeric characters but missing closing single quote as ILLEGAL" do
	assert_token "X'abcdEF12", TK::ILLEGAL
end

# keywords

test "tokenizes ABORT as ABORT" do
	assert_token "ABORT", TK::ABORT
end

test "tokenizes ACTION as ACTION" do
	assert_token "ACTION", TK::ACTION
end

test "tokenizes ADD as ADD" do
	assert_token "ADD", TK::ADD
end

test "tokenizes AFTER as AFTER" do
	assert_token "AFTER", TK::AFTER
end

test "tokenizes ALL as ALL" do
	assert_token "ALL", TK::ALL
end

test "tokenizes ALTER as ALTER" do
	assert_token "ALTER", TK::ALTER
end

test "tokenizes ALWAYS as ALWAYS" do
	assert_token "ALWAYS", TK::ALWAYS
end

test "tokenizes ANALYZE as ANALYZE" do
	assert_token "ANALYZE", TK::ANALYZE
end

test "tokenizes AND as AND" do
	assert_token "AND", TK::AND
end

test "tokenizes AS as AS" do
	assert_token "AS", TK::AS
end

test "tokenizes ASC as ASC" do
	assert_token "ASC", TK::ASC
end

test "tokenizes ATTACH as ATTACH" do
	assert_token "ATTACH", TK::ATTACH
end

test "tokenizes AUTOINCREMENT as AUTOINCR" do
	assert_token "AUTOINCREMENT", TK::AUTOINCR
end

test "tokenizes BEFORE as BEFORE" do
	assert_token "BEFORE", TK::BEFORE
end

test "tokenizes BEGIN as BEGIN" do
	assert_token "BEGIN", TK::BEGIN
end

test "tokenizes BETWEEN as BETWEEN" do
	assert_token "BETWEEN", TK::BETWEEN
end

test "tokenizes BY as BY" do
	assert_token "BY", TK::BY
end

test "tokenizes CASCADE as CASCADE" do
	assert_token "CASCADE", TK::CASCADE
end

test "tokenizes CASE as CASE" do
	assert_token "CASE", TK::CASE
end

test "tokenizes CAST as CAST" do
	assert_token "CAST", TK::CAST
end

test "tokenizes CHECK as CHECK" do
	assert_token "CHECK", TK::CHECK
end

test "tokenizes COLLATE as COLLATE" do
	assert_token "COLLATE", TK::COLLATE
end

test "tokenizes COLUMN as COLUMNKW" do
	assert_token "COLUMN", TK::COLUMNKW
end

test "tokenizes COMMIT as COMMIT" do
	assert_token "COMMIT", TK::COMMIT
end

test "tokenizes CONFLICT as CONFLICT" do
	assert_token "CONFLICT", TK::CONFLICT
end

test "tokenizes CONSTRAINT as CONSTRAINT" do
	assert_token "CONSTRAINT", TK::CONSTRAINT
end

test "tokenizes CREATE as CREATE" do
	assert_token "CREATE", TK::CREATE
end

test "tokenizes CROSS as JOIN_KW" do
	assert_token "CROSS", TK::JOIN_KW
end

test "tokenizes CURRENT as CURRENT" do
	assert_token "CURRENT", TK::CURRENT
end

test "tokenizes CURRENT_DATE as CTIME_KW" do
	assert_token "CURRENT_DATE", TK::CTIME_KW
end

test "tokenizes CURRENT_TIME as CTIME_KW" do
	assert_token "CURRENT_TIME", TK::CTIME_KW
end

	test "tokenizes CURRENT_TIMESTAMP as CTIME_KW" do
		assert_token "CURRENT_TIMESTAMP", TK::CTIME_KW
	end

test "tokenizes DATABASE as DATABASE" do
	assert_token "DATABASE", TK::DATABASE
end

test "tokenizes DEFAULT as DEFAULT" do
	assert_token "DEFAULT", TK::DEFAULT
end

test "tokenizes DEFERRED as DEFERRED" do
	assert_token "DEFERRED", TK::DEFERRED
end

test "tokenizes DEFERRABLE as DEFERRABLE" do
	assert_token "DEFERRABLE", TK::DEFERRABLE
end

test "tokenizes DELETE as DELETE" do
	assert_token "DELETE", TK::DELETE
end

test "tokenizes DESC as DESC" do
	assert_token "DESC", TK::DESC
end

test "tokenizes DETACH as DETACH" do
	assert_token "DETACH", TK::DETACH
end

test "tokenizes DISTINCT as DISTINCT" do
	assert_token "DISTINCT", TK::DISTINCT
end

test "tokenizes DO as DO" do
	assert_token "DO", TK::DO
end

test "tokenizes DROP as DROP" do
	assert_token "DROP", TK::DROP
end

test "tokenizes END as END" do
	assert_token "END", TK::END
end

test "tokenizes EACH as EACH" do
	assert_token "EACH", TK::EACH
end

test "tokenizes ELSE as ELSE" do
	assert_token "ELSE", TK::ELSE
end

test "tokenizes ESCAPE as ESCAPE" do
	assert_token "ESCAPE", TK::ESCAPE
end

test "tokenizes EXCEPT as EXCEPT" do
	assert_token "EXCEPT", TK::EXCEPT
end

test "tokenizes EXCLUSIVE as EXCLUSIVE" do
	assert_token "EXCLUSIVE", TK::EXCLUSIVE
end

test "tokenizes EXCLUDE as EXCLUDE" do
	assert_token "EXCLUDE", TK::EXCLUDE
end

test "tokenizes EXISTS as EXISTS" do
	assert_token "EXISTS", TK::EXISTS
end

test "tokenizes EXPLAIN as EXPLAIN" do
	assert_token "EXPLAIN", TK::EXPLAIN
end

test "tokenizes FAIL as FAIL" do
	assert_token "FAIL", TK::FAIL
end

test "tokenizes FILTER as FILTER" do
	assert_token "FILTER", TK::FILTER
end

test "tokenizes FIRST as FIRST" do
	assert_token "FIRST", TK::FIRST
end

test "tokenizes FOLLOWING as FOLLOWING" do
	assert_token "FOLLOWING", TK::FOLLOWING
end

test "tokenizes FOR as FOR" do
	assert_token "FOR", TK::FOR
end

test "tokenizes FOREIGN as FOREIGN" do
	assert_token "FOREIGN", TK::FOREIGN
end

test "tokenizes FROM as FROM" do
	assert_token "FROM", TK::FROM
end

test "tokenizes FULL as JOIN_KW" do
	assert_token "FULL", TK::JOIN_KW
end

test "tokenizes GENERATED as GENERATED" do
	assert_token "GENERATED", TK::GENERATED
end

test "tokenizes GLOB as LIKE_KW" do
	assert_token "GLOB", TK::LIKE_KW
end

test "tokenizes GROUP as GROUP" do
	assert_token "GROUP", TK::GROUP
end

test "tokenizes GROUPS as GROUPS" do
	assert_token "GROUPS", TK::GROUPS
end

test "tokenizes HAVING as HAVING" do
	assert_token "HAVING", TK::HAVING
end

test "tokenizes IF as IF" do
	assert_token "IF", TK::IF
end

test "tokenizes IGNORE as IGNORE" do
	assert_token "IGNORE", TK::IGNORE
end

test "tokenizes IMMEDIATE as IMMEDIATE" do
	assert_token "IMMEDIATE", TK::IMMEDIATE
end

test "tokenizes IN as IN" do
	assert_token "IN", TK::IN
end

test "tokenizes INDEX as INDEX" do
	assert_token "INDEX", TK::INDEX
end

test "tokenizes INDEXED as INDEXED" do
	assert_token "INDEXED", TK::INDEXED
end

test "tokenizes INITIALLY as INITIALLY" do
	assert_token "INITIALLY", TK::INITIALLY
end

test "tokenizes INNER as JOIN_KW" do
	assert_token "INNER", TK::JOIN_KW
end

test "tokenizes INSERT as INSERT" do
	assert_token "INSERT", TK::INSERT
end

test "tokenizes INSTEAD as INSTEAD" do
	assert_token "INSTEAD", TK::INSTEAD
end

test "tokenizes INTERSECT as INTERSECT" do
	assert_token "INTERSECT", TK::INTERSECT
end

test "tokenizes INTO as INTO" do
	assert_token "INTO", TK::INTO
end

test "tokenizes IS as IS" do
	assert_token "IS", TK::IS
end

test "tokenizes ISNULL as ISNULL" do
	assert_token "ISNULL", TK::ISNULL
end

test "tokenizes JOIN as JOIN" do
	assert_token "JOIN", TK::JOIN
end

test "tokenizes KEY as KEY" do
	assert_token "KEY", TK::KEY
end

test "tokenizes LAST as LAST" do
	assert_token "LAST", TK::LAST
end

test "tokenizes LEFT as JOIN_KW" do
	assert_token "LEFT", TK::JOIN_KW
end

test "tokenizes LIKE as LIKE_KW" do
	assert_token "LIKE", TK::LIKE_KW
end

test "tokenizes LIMIT as LIMIT" do
	assert_token "LIMIT", TK::LIMIT
end

test "tokenizes MATCH as MATCH" do
	assert_token "MATCH", TK::MATCH
end

test "tokenizes MATERIALIZED as MATERIALIZED" do
	assert_token "MATERIALIZED", TK::MATERIALIZED
end

test "tokenizes NATURAL as JOIN_KW" do
	assert_token "NATURAL", TK::JOIN_KW
end

test "tokenizes NO as NO" do
	assert_token "NO", TK::NO
end

test "tokenizes NOT as NOT" do
	assert_token "NOT", TK::NOT
end

test "tokenizes NOTHING as NOTHING" do
	assert_token "NOTHING", TK::NOTHING
end

test "tokenizes NOTNULL as NOTNULL" do
	assert_token "NOTNULL", TK::NOTNULL
end

test "tokenizes NULL as NULL" do
	assert_token "NULL", TK::NULL
end

test "tokenizes NULLS as NULLS" do
	assert_token "NULLS", TK::NULLS
end

test "tokenizes OF as OF" do
	assert_token "OF", TK::OF
end

test "tokenizes OFFSET as OFFSET" do
	assert_token "OFFSET", TK::OFFSET
end

test "tokenizes ON as ON" do
	assert_token "ON", TK::ON
end

test "tokenizes OR as OR" do
	assert_token "OR", TK::OR
end

test "tokenizes ORDER as ORDER" do
	assert_token "ORDER", TK::ORDER
end

test "tokenizes OTHERS as OTHERS" do
	assert_token "OTHERS", TK::OTHERS
end

test "tokenizes OUTER as JOIN_KW" do
	assert_token "OUTER", TK::JOIN_KW
end

test "tokenizes OVER as OVER" do
	assert_token "OVER", TK::OVER
end

test "tokenizes PARTITION as PARTITION" do
	assert_token "PARTITION", TK::PARTITION
end

test "tokenizes PLAN as PLAN" do
	assert_token "PLAN", TK::PLAN
end

test "tokenizes PRAGMA as PRAGMA" do
	assert_token "PRAGMA", TK::PRAGMA
end

test "tokenizes PRECEDING as PRECEDING" do
	assert_token "PRECEDING", TK::PRECEDING
end

test "tokenizes PRIMARY as PRIMARY" do
	assert_token "PRIMARY", TK::PRIMARY
end

test "tokenizes QUERY as QUERY" do
	assert_token "QUERY", TK::QUERY
end

test "tokenizes RAISE as RAISE" do
	assert_token "RAISE", TK::RAISE
end

test "tokenizes RANGE as RANGE" do
	assert_token "RANGE", TK::RANGE
end

test "tokenizes RECURSIVE as RECURSIVE" do
	assert_token "RECURSIVE", TK::RECURSIVE
end

test "tokenizes REFERENCES as REFERENCES" do
	assert_token "REFERENCES", TK::REFERENCES
end

test "tokenizes REGEXP as LIKE_KW" do
	assert_token "REGEXP", TK::LIKE_KW
end

test "tokenizes REINDEX as REINDEX" do
	assert_token "REINDEX", TK::REINDEX
end

test "tokenizes RELEASE as RELEASE" do
	assert_token "RELEASE", TK::RELEASE
end

test "tokenizes RENAME as RENAME" do
	assert_token "RENAME", TK::RENAME
end

test "tokenizes REPLACE as REPLACE" do
	assert_token "REPLACE", TK::REPLACE
end

test "tokenizes RESTRICT as RESTRICT" do
	assert_token "RESTRICT", TK::RESTRICT
end

test "tokenizes RETURNING as RETURNING" do
	assert_token "RETURNING", TK::RETURNING
end

test "tokenizes RIGHT as JOIN_KW" do
	assert_token "RIGHT", TK::JOIN_KW
end

test "tokenizes ROLLBACK as ROLLBACK" do
	assert_token "ROLLBACK", TK::ROLLBACK
end

test "tokenizes ROW as ROW" do
	assert_token "ROW", TK::ROW
end

test "tokenizes ROWS as ROWS" do
	assert_token "ROWS", TK::ROWS
end

test "tokenizes SAVEPOINT as SAVEPOINT" do
	assert_token "SAVEPOINT", TK::SAVEPOINT
end

test "tokenizes SELECT as SELECT" do
	assert_token "SELECT", TK::SELECT
end

test "tokenizes SET as SET" do
	assert_token "SET", TK::SET
end

test "tokenizes TABLE as TABLE" do
	assert_token "TABLE", TK::TABLE
end

test "tokenizes TEMP as TEMP" do
	assert_token "TEMP", TK::TEMP
end

test "tokenizes TEMPORARY as TEMP" do
	assert_token "TEMPORARY", TK::TEMP
end

test "tokenizes THEN as THEN" do
	assert_token "THEN", TK::THEN
end

test "tokenizes TIES as TIES" do
	assert_token "TIES", TK::TIES
end

test "tokenizes TO as TO" do
	assert_token "TO", TK::TO
end

test "tokenizes TRANSACTION as TRANSACTION" do
	assert_token "TRANSACTION", TK::TRANSACTION
end

test "tokenizes TRIGGER as TRIGGER" do
	assert_token "TRIGGER", TK::TRIGGER
end

test "tokenizes UNBOUNDED as UNBOUNDED" do
	assert_token "UNBOUNDED", TK::UNBOUNDED
end

test "tokenizes UNION as UNION" do
	assert_token "UNION", TK::UNION
end

test "tokenizes UNIQUE as UNIQUE" do
	assert_token "UNIQUE", TK::UNIQUE
end

test "tokenizes UPDATE as UPDATE" do
	assert_token "UPDATE", TK::UPDATE
end

test "tokenizes USING as USING" do
	assert_token "USING", TK::USING
end

test "tokenizes VACUUM as VACUUM" do
	assert_token "VACUUM", TK::VACUUM
end

test "tokenizes VALUES as VALUES" do
	assert_token "VALUES", TK::VALUES
end

test "tokenizes VIEW as VIEW" do
	assert_token "VIEW", TK::VIEW
end

test "tokenizes VIRTUAL as VIRTUAL" do
	assert_token "VIRTUAL", TK::VIRTUAL
end

test "tokenizes WHEN as WHEN" do
	assert_token "WHEN", TK::WHEN
end

test "tokenizes WHERE as WHERE" do
	assert_token "WHERE", TK::WHERE
end

test "tokenizes WINDOW as WINDOW" do
	assert_token "WINDOW", TK::WINDOW
end

test "tokenizes WITH as WITH" do
	assert_token "WITH", TK::WITH
end

test "tokenizes WITHOUT as WITHOUT" do
	assert_token "WITHOUT", TK::WITHOUT
end

# illegal strings

test "tokenizes 1.0e+ as ILLEGAL" do
	assert_equal(
		[TK::ILLEGAL["1.0e"], TK::PLUS["+"]],
		Plume.tokenize("1.0e+")
	)
end
test "tokenizes 1.0E+ as ILLEGAL" do
	assert_equal(
		[TK::ILLEGAL["1.0E"], TK::PLUS["+"]],
		Plume.tokenize("1.0E+")
	)
end
test "tokenizes 1.0e- as ILLEGAL" do
	assert_equal(
		[TK::ILLEGAL["1.0e"], TK::MINUS["-"]],
		Plume.tokenize("1.0e-")
	)
end
test "tokenizes 1.0E- as ILLEGAL" do
	assert_equal(
		[TK::ILLEGAL["1.0E"], TK::MINUS["-"]],
		Plume.tokenize("1.0E-")
	)
end
test "tokenizes 1.0e+/ as ILLEGAL" do
	assert_equal(
		[TK::ILLEGAL["1.0e"], TK::PLUS["+"], TK::SLASH["/"]],
		Plume.tokenize("1.0e+/")
	)
end
test "tokenizes 1.0E+: as ILLEGAL" do
	assert_equal(
		[TK::ILLEGAL["1.0E"], TK::PLUS["+"], TK::ILLEGAL[":"]],
		Plume.tokenize("1.0E+:")
	)
end
test "tokenizes 1.0e-: as ILLEGAL" do
	assert_equal(
		[TK::ILLEGAL["1.0e"], TK::MINUS["-"], TK::ILLEGAL[":"]],
		Plume.tokenize("1.0e-:")
	)
end
test "tokenizes 1.0E-/ as ILLEGAL" do
	assert_equal(
		[TK::ILLEGAL["1.0E"], TK::MINUS["-"], TK::SLASH["/"]],
		Plume.tokenize("1.0E-/")
	)
end
test "tokenizes 1.0F+5 as ILLEGAL" do
	assert_equal(
		[TK::ILLEGAL["1.0F"], TK::PLUS["+"], TK::INTEGER["5"]],
		Plume.tokenize("1.0F+5")
	)
end
test "tokenizes 1.0d-10 as ILLEGAL" do
	assert_equal(
		[TK::ILLEGAL["1.0d"], TK::MINUS["-"], TK::INTEGER["10"]],
		Plume.tokenize("1.0d-10")
	)
end
test "tokenizes 1.0e,5 as ILLEGAL" do
	assert_equal(
		[TK::ILLEGAL["1.0e"], TK::COMMA[","], TK::INTEGER["5"]],
		Plume.tokenize("1.0e,5")
	)
end
test "tokenizes 1.0E.10 as ILLEGAL" do
	assert_equal(
		[TK::ILLEGAL["1.0E"], TK::FLOAT[".10"]],
		Plume.tokenize("1.0E.10")
	)
end
test "tokenizes 2 /* as ILLEGAL" do
	assert_equal(
		[TK::INTEGER["2"], TK::SPACE[" "], TK::SLASH["/"], TK::STAR["*"]],
		Plume.tokenize("2 /*")
	)
end
test "tokenizes 2 /*  as ILLEGAL" do
	assert_equal(
		[TK::INTEGER["2"], TK::SPACE[" "], TK::SPACE["/*"], TK::SPACE[" "]],
		Plume.tokenize("2 /* ")
	)
end
