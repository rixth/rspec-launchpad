# RSpec::Launchpad

Show RSpec results on the pads of a Novation Launchpad.

## Installation

Add `rspec-launchpad` to your application's Gemfile, then run bundle install. You must have portmidi installed, which you can get on OS X by running `brew install portmidi`.

## Usage

Add the RSpec options below to wherever you run rspec from (cli, guard, etc). You can combine this reporter with others, to enable both text & Launchpad output.

    `-r rspec-launchpad -f RSpec::Launchpad::Reporter`

Each pad on the device represents one spec. The pad will turn green if the test passed, red if it failed, or yellow if it is pending.

Once all tests has been run, the mixer and scene buttons will represent the overall state of the tests. If everything was OK, they will both be green. If there were any failed specs, the top row will be red. If there were any pending specs, the right row will be yellow.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request