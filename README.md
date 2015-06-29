# Zoid &mdash; Friendly JSON API consumer

![zoid](http://pre12.deviantart.net/81ba/th/pre/f/2013/022/e/1/why_not_zoidberg___by_claustrophobias-d5sbjw8.png)

[![Build Status](https://semaphoreci.com/api/v1/projects/3b10a258-56ac-4e32-8a02-01710a2b817c/468022/badge.svg)](https://semaphoreci.com/shiroyasha/zoid)

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

closed_issues.pluck(&:title)
```

### Configuring the connection

Zoid agent uses Faraday to communicate with remote servers,
and it doesn't try to hide this fact. For example, you
can use your favorite faraday middlewares with Zoid

``` rb
Zoid::Agent.new("https://api.github.com") do |faraday|
  faraday.use FaradayMiddleware::OAuth2, 'TOKEN'
end
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
