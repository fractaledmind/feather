# Feather

Feather is a Ruby library for working with SQLite elegantly. Presently, this means that it provides a pure Ruby implementation of SQLite's lexer/tokenizer. This is useful for introspecting the structure of SQL queries, and for building tools that work with SQL queries.

## Installation

This library is not presently a gem, so you will need to clone the repository to install:

```bash
git clone git@github.com:fractaledmind/feather.git
```

## Usage

Tokenize a SQL query with the `Feather::Lexer` class:

```ruby
lexer = Feather::Lexer.new("SELECT * FROM users WHERE id = 1")
tokens = lexer.tokenize
# =>
# [Feather::TK::SELECT["SELECT"],
#  Feather::TK::SPACE[" "],
#  Feather::TK::STAR["*"],
#  Feather::TK::SPACE[" "],
#  Feather::TK::FROM["FROM"],
#  Feather::TK::SPACE[" "],
#  Feather::TK::ID["users"],
#  Feather::TK::SPACE[" "],
#  Feather::TK::WHERE["WHERE"],
#  Feather::TK::SPACE[" "],
#  Feather::TK::ID["id"],
#  Feather::TK::SPACE[" "],
#  Feather::TK::EQ["="],
#  Feather::TK::SPACE[" "],
#  Feather::TK::INTEGER["1"]]
```

You can find all of the token types in the `Feather::TK` module. SQLite works with a grammar of _167_ token types (`Feather::TK.constants.size`), _136_ of which are keywords (`Feather::TK.constants.select { |c| Feather::TK.const_get(c) < Feather::KeywordToken }.size`). The remaining _31_ are punctuation, operators, and literals.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fractaledmind/feather. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/fractaledmind/feather/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Feather project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/fractaledmind/feather/blob/main/CODE_OF_CONDUCT.md).
