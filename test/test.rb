require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
###################################

require 'fileutils'
require 'minitest/autorun'
require 'yaml'

require 'spectro'
require 'spectro/client'
require 'spectro/compiler'
require 'spectro/spec/parser'

require_relative 'minitest/test_spectro'
