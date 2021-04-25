# TODO: Write documentation for `Smalldata`

require "./errors"
require "option_parser"
require "./readers/*"

VERSION = "0.1.0"

def process_file(filename, recurse)
  readers = [Smalldata::Readers::Base64]

  readers.each do |rdr|
    r = rdr.new(File.open(filename))
    r.each do |data|
      puts("#{r.key}: #{data}")
    end
  end

  puts "  No included data."
end

def run
  recurse = false

  OptionParser.parse do |parser|
    parser.banner = "Usage: smalldata [-r] filename ..."
    parser.on("-r", "--recursive", "Recursively extract data") { recurse = true }
    parser.on("-h", "--help", "Show this help") do
      puts parser
      exit
    end
    parser.invalid_option do |flag|
      STDERR.puts "ERROR: #{flag} is not a valid option."
      STDERR.puts parser
      exit(1)
    end
  end

  ARGV.each {|filename| process_file(filename, recurse)}
  # could use ARGF to include stdin
end

begin
  run
rescue ex : Smalldata::Error
  puts "An error of some type has occurred: #{ex}"
  exit 1
end

