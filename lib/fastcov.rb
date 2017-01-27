require 'fastcov/version'
require 'json'

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
