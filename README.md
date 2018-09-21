# OmniAuth Windows Live

[![Code Climate](https://codeclimate.com/github/joel/omniauth-windowslive.png)](https://codeclimate.com/github/joel/omniauth-windowslive)

[![Dependency Status](https://gemnasium.com/joel/omniauth-windowslive.svg)](https://gemnasium.com/joel/omniauth-windowslive)

[![Build Status](https://travis-ci.org/joel/omniauth-windowslive.svg?branch=master)](https://travis-ci.org/joel/omniauth-windowslive) (Travis CI)

[![Coverage Status](https://coveralls.io/repos/joel/omniauth-windowslive/badge.svg?branch=master&service=github)](https://coveralls.io/github/joel/omniauth-windowslive?branch=master)

[![Gem Version](https://badge.fury.io/rb/omniauth-windowslive.svg)](http://badge.fury.io/rb/omniauth-windowslive)

This gem contains the unofficial WindowsLive strategy for OmniAuth.

## Basic Usage

	use OmniAuth::Builder do
		provider "windowslive", ENV['WINDOWSLIVE_CLIENT_ID'], ENV['WINDOWSLIVE_SECRET'], :scope => 'wl.basic'
	end

## Supported Flows

To register an application and get your ID and Secret, login to / create an account here: https://apps.dev.microsoft.com/ and create your application.

## Ruby

Tested with the following Ruby versions:

- RUBY 2.2.2
