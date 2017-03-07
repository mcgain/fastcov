require 'spec_helper'
require 'json'
require 'english'

describe Fastcov do
  it 'writes a filename including the process id (pid)' do
    pid = run_sample_code

    expect(File).to exist("log/fastcov-#{pid}.json")
  end

  it 'produces a coverage report in json' do
    pid = run_sample_code
    content = JSON.parse(File.read("log/fastcov-#{pid}.json"))
    expect(content).to eq(
      File.join(Dir.pwd, %w(spec fixtures sample_code.rb)) =>
      [1, 1, nil, 1, 1, 1, 1, nil, 0, nil, 1, nil, 1, nil]
    )
  end

  it 'maintains the exit code in successful cases' do
    run_sample_code
    expect($CHILD_STATUS.exitstatus).to eq(0)
  end

  it 'maintains the exit code in failure cases' do
    pid = spawn('ruby spec/fixtures/sample_code_with_failure_entry_point.rb')
    Process.wait(pid)
    expect($CHILD_STATUS.exitstatus).to eq(10)
  end

  def run_sample_code
    pid = spawn('ruby spec/fixtures/sample_code_entry_point.rb')
    Process.wait(pid)
    pid
  end
end
