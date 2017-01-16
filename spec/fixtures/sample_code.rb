require 'bundler/setup'
require 'fastcov'

class SampleClass
  def call
    if true
      x = 1
    else
      x = 2
    end
    x
  end
  SampleClass.new.call
end
