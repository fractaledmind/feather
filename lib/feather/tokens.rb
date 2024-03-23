# frozen_string_literal: true

module Feather
	class Token
		attr_reader :value

		def self.[](value)
			new(value)
		end

		def initialize(value)
			@value = value
		end

		def inspect = "#{self.class.name}[#{@value.inspect}]"

		def ==(other)
			other.is_a?(self.class) && other.value == @value
		end
	end
	class KeywordToken < Token; end
	class IDKeywordToken < KeywordToken; end

	module TK; end

	class TK::ABORT < IDKeywordToken; end
	class TK::ACTION < IDKeywordToken; end
	class TK::ADD < KeywordToken; end
	class TK::AFTER < IDKeywordToken; end
	class TK::ALL < KeywordToken; end
	class TK::ALTER < KeywordToken; end
	class TK::ALWAYS < IDKeywordToken; end
	class TK::ANALYZE < IDKeywordToken; end
	class TK::AND < KeywordToken; end
	class TK::AS < KeywordToken; end
	class TK::ASC < IDKeywordToken; end
	class TK::ATTACH < IDKeywordToken; end
	class TK::AUTOINCR < KeywordToken; end
	class TK::BEFORE < IDKeywordToken; end
	class TK::BEGIN < IDKeywordToken; end
	class TK::BETWEEN < KeywordToken; end
	class TK::BITAND < Token; end
	class TK::BITNOT < Token; end
	class TK::BITOR < Token; end
	class TK::BLOB < Token; end
	class TK::BY < IDKeywordToken; end
	class TK::CASCADE < IDKeywordToken; end
	class TK::CASE < KeywordToken; end
	class TK::CAST < IDKeywordToken; end
	class TK::CHECK < KeywordToken; end
	class TK::COLLATE < KeywordToken; end
	class TK::COLUMNKW < IDKeywordToken; end
	class TK::COMMA < Token; end
	class TK::COMMIT < KeywordToken; end
	class TK::CONCAT < Token; end
	class TK::CONFLICT < IDKeywordToken; end
	class TK::CONSTRAINT < KeywordToken; end
	class TK::CREATE < KeywordToken; end
	class TK::CTIME_KW < IDKeywordToken; end
	class TK::CURRENT < IDKeywordToken; end
	class TK::DATABASE < IDKeywordToken; end
	class TK::DEFAULT < KeywordToken; end
	class TK::DEFERRABLE < KeywordToken; end
	class TK::DEFERRED < IDKeywordToken; end
	class TK::DELETE < KeywordToken; end
	class TK::DESC < IDKeywordToken; end
	class TK::DETACH < IDKeywordToken; end
	class TK::DISTINCT < KeywordToken; end
	class TK::DO < IDKeywordToken; end
	class TK::DOT < Token; end
	class TK::DROP < KeywordToken; end
	class TK::EACH < IDKeywordToken; end
	class TK::ELSE < KeywordToken; end
	class TK::END < IDKeywordToken; end
	class TK::EQ < Token; end
	class TK::ESCAPE < KeywordToken; end
	class TK::EXCEPT < KeywordToken; end
	class TK::EXCLUDE < IDKeywordToken; end
	class TK::EXCLUSIVE < IDKeywordToken; end
	class TK::EXISTS < KeywordToken; end
	class TK::EXPLAIN < IDKeywordToken; end
	class TK::FAIL < IDKeywordToken; end
	class TK::FILTER < KeywordToken; end
	class TK::FIRST < IDKeywordToken; end
	class TK::FLOAT < Token; end
	class TK::FOLLOWING < IDKeywordToken; end
	class TK::FOR < IDKeywordToken; end
	class TK::FOREIGN < KeywordToken; end
	class TK::FROM < KeywordToken; end
	class TK::GE < Token; end
	class TK::GENERATED < IDKeywordToken; end
	class TK::GROUP < KeywordToken; end
	class TK::GROUPS < IDKeywordToken; end
	class TK::GT < Token; end
	class TK::HAVING < KeywordToken; end
	class TK::ID < Token; end
	class TK::IF < IDKeywordToken; end
	class TK::IGNORE < IDKeywordToken; end
	class TK::ILLEGAL < Token; end
	class TK::IMMEDIATE < IDKeywordToken; end
	class TK::IN < KeywordToken; end
	class TK::INDEX < KeywordToken; end
	class TK::INDEXED < KeywordToken; end
	class TK::INITIALLY < IDKeywordToken; end
	class TK::INSERT < KeywordToken; end
	class TK::INSTEAD < IDKeywordToken; end
	class TK::INTEGER < Token; end
	class TK::INTERSECT < KeywordToken; end
	class TK::INTO < KeywordToken; end
	class TK::IS < KeywordToken; end
	class TK::ISNULL < KeywordToken; end
	class TK::JOIN < KeywordToken; end
	class TK::JOIN_KW < KeywordToken; end
	class TK::KEY < IDKeywordToken; end
	class TK::LAST < IDKeywordToken; end
	class TK::LE < Token; end
	class TK::LIKE_KW < IDKeywordToken; end
	class TK::LIMIT < KeywordToken; end
	class TK::LP < Token; end
	class TK::LSHIFT < Token; end
	class TK::LT < Token; end
	class TK::MATCH < IDKeywordToken; end
	class TK::MATERIALIZED < IDKeywordToken; end
	class TK::MINUS < Token; end
	class TK::NE < Token; end
	class TK::NO < IDKeywordToken; end
	class TK::NOT < KeywordToken; end
	class TK::NOTHING < KeywordToken; end
	class TK::NOTNULL < KeywordToken; end
	class TK::NULL < KeywordToken; end
	class TK::NULLS < IDKeywordToken; end
	class TK::OF < IDKeywordToken; end
	class TK::OFFSET < IDKeywordToken; end
	class TK::ON < KeywordToken; end
	class TK::OR < KeywordToken; end
	class TK::ORDER < KeywordToken; end
	class TK::OTHERS < IDKeywordToken; end
	class TK::OVER < KeywordToken; end
	class TK::PARTITION < IDKeywordToken; end
	class TK::PLAN < IDKeywordToken; end
	class TK::PLUS < Token; end
	class TK::PRAGMA < IDKeywordToken; end
	class TK::PRECEDING < IDKeywordToken; end
	class TK::PRIMARY < KeywordToken; end
	class TK::PTR < Token; end
	class TK::QUERY < IDKeywordToken; end
	class TK::RAISE < IDKeywordToken; end
	class TK::RANGE < IDKeywordToken; end
	class TK::RECURSIVE < IDKeywordToken; end
	class TK::REFERENCES < KeywordToken; end
	class TK::REINDEX < IDKeywordToken; end
	class TK::RELEASE < IDKeywordToken; end
	class TK::REM < Token; end
	class TK::RENAME < IDKeywordToken; end
	class TK::REPLACE < IDKeywordToken; end
	class TK::RESTRICT < IDKeywordToken; end
	class TK::RETURNING < KeywordToken; end
	class TK::ROLLBACK < IDKeywordToken; end
	class TK::ROW < IDKeywordToken; end
	class TK::ROWS < IDKeywordToken; end
	class TK::RP < Token; end
	class TK::RSHIFT < Token; end
	class TK::SAVEPOINT < IDKeywordToken; end
	class TK::SELECT < KeywordToken; end
	class TK::SEMI < Token; end
	class TK::SET < KeywordToken; end
	class TK::SLASH < Token; end
	class TK::SPACE < Token; end
	class TK::STAR < Token; end
	class TK::STRING < Token; end
	class TK::TABLE < KeywordToken; end
	class TK::TEMP < IDKeywordToken; end
	class TK::THEN < KeywordToken; end
	class TK::TIES < IDKeywordToken; end
	class TK::TO < KeywordToken; end
	class TK::TRANSACTION < KeywordToken; end
	class TK::TRIGGER < IDKeywordToken; end
	class TK::UNBOUNDED < IDKeywordToken; end
	class TK::UNION < KeywordToken; end
	class TK::UNIQUE < KeywordToken; end
	class TK::UPDATE < KeywordToken; end
	class TK::USING < KeywordToken; end
	class TK::VACUUM < IDKeywordToken; end
	class TK::VALUES < KeywordToken; end
	class TK::VARIABLE < Token; end
	class TK::VIEW < IDKeywordToken; end
	class TK::VIRTUAL < IDKeywordToken; end
	class TK::WHEN < KeywordToken; end
	class TK::WHERE < KeywordToken; end
	class TK::WINDOW < KeywordToken; end
	class TK::WITH < IDKeywordToken; end
	class TK::WITHOUT < IDKeywordToken; end
end
