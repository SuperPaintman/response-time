# response\_time

[![Linux Build][travis-image]][travis-url]
[![Shards version][shards-image]][shards-url]


Response time for **Crystal** servers.


## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  response_time:
    github: SuperPaintman/response-time
```


--------------------------------------------------------------------------------

## Usage
### With pure Crystal server

```crystal
require "response_time"
require "http/server"

server = HTTP::Server.new("0.0.0.0", 8080,
  [
    ResponseTime::Handler.new
  ]) do |context|
  context.response.content_type = "text/plain"
  context.response.print "Hello response time!"
end

server.listen
```

### With Kemal

```crystal
require "response_time"
require "kemal"

add_handler ResponseTime::Handler.new

get "/" do |env|
  "Hello response time!"
end

Kemal.run
```


--------------------------------------------------------------------------------

## Test

```sh
crystal spec
```


--------------------------------------------------------------------------------

## Contributing

1. Fork it (<https://github.com/SuperPaintman/response-time/fork>)
2. Create your feature branch (`git checkout -b feature/<feature_name>`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin feature/<feature_name>`)
5. Create a new Pull Request


--------------------------------------------------------------------------------

## Contributors

- [SuperPaintman](https://github.com/SuperPaintman) SuperPaintman - creator, maintainer


--------------------------------------------------------------------------------

## API
[Docs][docs-url]


--------------------------------------------------------------------------------

## Changelog
[Changelog][changelog-url]


--------------------------------------------------------------------------------

## License

[MIT][license-url]


[license-url]: LICENSE
[changelog-url]: CHANGELOG.md
[docs-url]: https://superpaintman.github.io/response-time/
[travis-image]: https://img.shields.io/travis/SuperPaintman/response-time/master.svg?label=linux
[travis-url]: https://travis-ci.org/SuperPaintman/response-time
[shards-image]: https://img.shields.io/github/tag/superpaintman/response-time.svg?label=shards
[shards-url]: https://github.com/superpaintman/response-time

