require 'fastcov/version'
require 'json'

module Fastcov
  class << self
    def start
      require 'coverage'
      Coverage.start
      at_exit do
        result = Coverage.result
        Dir.mkdir('log') unless Dir.exists?('log')
        File.write("log/fastcov-#{Process.pid}.json", result.to_json)
      end
    end
  end
end
