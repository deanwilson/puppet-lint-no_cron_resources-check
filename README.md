# puppet-lint no_cron_resources check #

Extends puppet-lint to ensure no cron resources are contained in
the catalog.

[![Build Status](https://travis-ci.org/deanwilson/puppet-lint-no_cron_resources-check.svg?branch=master)](https://travis-ci.org/deanwilson/puppet-lint-no_cron_resources-check)

## Installation ##

To use this plugin add the following line to your Gemfile

    gem 'puppet-lint-no_cron_resources-check'

and then run `bundle install`.

## Usage ##

This plugin provides a new check to `puppet-lint`.

    cron resources should not be used


[Dean Wilson](http://www.unixdaemon.net)
