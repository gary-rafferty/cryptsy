$:.unshift(File.join(File.dirname(__FILE__),'..','lib'))

require 'coveralls'
Coveralls.wear!

require 'minitest/autorun'
require 'minitest/spec'
require 'mocha/setup'
require 'cryptsy'
