# puppet-lint no_cron_resources check #

Extends puppet-lint to ensure no cron resources are contained in
the catalog.

[![Build Status](https://travis-ci.org/deanwilson/puppet-lint-no_cron_resources-check.svg?branch=master)](https://travis-ci.org/deanwilson/puppet-lint-no_cron_resources-check)

Sometimes there are certain `puppet` resource types that you don't want
to include in your code base. This could be a fragile one like `cron`,
an easy to abuse one like `augeas` or one you just dislike the name
of, I'm looking at you `computer`. This `puppet-lint` check will
display a warning each time it finds a usage of that resource, in this
case `cron`.

## Installation ##

To use this plugin add the following line to your Gemfile

    gem 'puppet-lint-no_cron_resources-check'

and then run `bundle install`

## Usage ##

This plugin provides a new check to `puppet-lint` that warns if it finds
a `cron` resource.

    cron resources should not be used

## Customisation ##

It may be that you love `cron` resources but hate the idea of another
specific type appearing in your code. To modify this `puppet-line` check
to detect another type you only need to run the following commands:

    # grab this repo
    git clone https://github.com/deanwilson/puppet-lint-no_cron_resources-check.git

    # make a new copy of the code and cd to it
    cp -a puppet-lint-no_cron_resources-check puppet-lint-no_augeas_resources-check
    cd puppet-lint-no_augeas_resources-check/

    # rename the files and replace the resource type.
    find | grep -v .git | xargs -n 1 rename cron augeas
    find -type f | grep -v .git | xargs sed -i -e 's/cron/augeas/g'

    # and rerun the tests
    bundle exec rake spec

### Author ###
[Dean Wilson](http://www.unixdaemon.net)
