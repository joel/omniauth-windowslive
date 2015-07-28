# OmniAuth Windows Live

[![Code Climate](https://codeclimate.com/github/joel/omniauth-windowslive.png)](https://codeclimate.com/github/joel/omniauth-windowslive)

[![Dependency Status](https://gemnasium.com/joel/omniauth-windowslive.png)](https://gemnasium.com/joel/omniauth-windowslive)

[![Build Status](https://travis-ci.org/joel/omniauth-windowslive.png?branch=master)](https://travis-ci.org/joel/omniauth-windowslive) (Travis CI)

[![Coverage Status](https://coveralls.io/repos/joel/omniauth-windowslive/badge.svg?branch=master)](https://coveralls.io/r/joel/omniauth-windowslive?branch=master)

This gem contains the unofficial WindowsLive strategy for OmniAuth.

## Basic Usage

	use OmniAuth::Builder do
		provider "windowslive", ENV['WINDOWSLIVE_CLIENT_ID'], ENV['WINDOWSLIVE_SECRET'], :scope => 'wl.basic'
	end

## Supported Flows

for create app
https://manage.dev.live.com/Applications/Index?wa=wsignin1.0
OR
https://manage.dev.live.com/AddApplication.aspx?tou=1

## Ruby

Tested with the following Ruby versions:

- RUBY 2.2.2
