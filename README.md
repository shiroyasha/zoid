# Zoid

Friendly Json API consumer.

## Usage

Start by creating an agent for the API endpoint

``` rb
github_agent = Zoid::Agent.new("https://api.github.com")
```

Use the agent to communicate with the API

``` rb
response = github_agent.get "/repos/vmg/redcarpet/issues", {:state => "closed"}
```

The body is already parsed, and ready for consumation

``` rb
closed_issues = response.body

titles = closed_issues.map { |issue| issue.title }

puts titles
```

## Installation

Add this line to your application's Gemfile:

``` rb
gem 'zoid'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/shiroyasha/zoid/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
