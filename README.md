# Plume

<img src="/assets/logo.svg" width="100" alt="Plume logo: a blue feather quill pen" align="right" />

Plume is a Ruby library for working with SQLite elegantly. Presently, this means that it provides a pure Ruby implementation of SQLite's lexer/tokenizer. This is useful for introspecting the structure of SQL queries, and for building tools that work with SQL queries.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add plume
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install plume
```

## Usage

Tokenize a SQL query with the `Plume::Lexer` class:

```ruby
lexer = Plume::Lexer.new("SELECT * FROM users WHERE id = 1")
tokens = lexer.tokenize
# =>
# [Plume::TK::SELECT["SELECT"],
#  Plume::TK::SPACE[" "],
#  Plume::TK::STAR["*"],
#  Plume::TK::SPACE[" "],
#  Plume::TK::FROM["FROM"],
#  Plume::TK::SPACE[" "],
#  Plume::TK::ID["users"],
#  Plume::TK::SPACE[" "],
#  Plume::TK::WHERE["WHERE"],
#  Plume::TK::SPACE[" "],
#  Plume::TK::ID["id"],
#  Plume::TK::SPACE[" "],
#  Plume::TK::EQ["="],
#  Plume::TK::SPACE[" "],
#  Plume::TK::INTEGER["1"]]
```

You can find all of the token types in the `Plume::TK` module. SQLite works with a grammar of _167_ token types (`Plume::TK.constants.size`), _136_ of which are keywords (`Plume::TK.constants.select { |c| Plume::TK.const_get(c) < Plume::KeywordToken }.size`). The remaining _31_ are punctuation, operators, and literals.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fractaledmind/plume. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/fractaledmind/plume/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Plume project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/fractaledmind/plume/blob/main/CODE_OF_CONDUCT.md).
