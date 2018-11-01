# galois-lfsr

Galois configuration (or internal XOR) Linear Feedback Shift Register (LFSR)

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  galois-lfsr:
    github: teknomunk/cr-galois-lfsr
```

## Usage

```crystal
require "galois-lfsr"

l = LFSR::Galois.new( LFSR::MAX_16 )
10.times do
	puts l.next
end
```

## Contributing

1. Fork it (<https://github.com/teknomunk/galois-lfsr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [teknomunk](https://github.com/your-github-user) teknomunk - creator, maintainer
