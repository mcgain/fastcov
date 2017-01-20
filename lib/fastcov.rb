require 'fastcov/version'
require 'json'
# require "fastcov/file_writer"
# require "fastcov/coverage"

module Fastcov
  class << self
    def start
      require 'coverage'
      Coverage.start
      at_exit do
        result = Coverage.result
        File.write("/tmp/fastcov-#{Process.pid}.json", result.to_json)
      end
    end
  end
end

