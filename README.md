# Omniauth::Zooniverse

OmniAuth oAuth strategy for the Zooniverse.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-zooniverse'
```

And then execute:

```shell
$ bundle install
```

Or install it yourself as:

```shell
$ gem install omniauth-zooniverse
```

## Usage

Configure the strategy in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :zooniverse, ENV['ZOONIVERSE_APP_ID'], ENV['ZOONIVERSE_APP_SECRET']
end
```

Refer to the docs for more information on how to use omniauth in your app, https://github.com/intridea/omniauth#integrating-omniauth-into-your-application

## Development

Use docker & compose to setup the dev env

```shell
$ docker-compose build
```

Run a bash shell inside the new container

```shell
$ docker-compose run --service-ports --rm -e omniauth-zooniverse bash
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/omniauth-zooniverse/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
