# TODO: Write documentation for `Smalldata`

require "option_parser"
module Smalldata
  extend self

  VERSION = "0.1.0"

  def process_file(filename, recurse)
    puts "  No included data."
  end

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

  ARGV.each {|filename| Smalldata.process_file(filename, recurse)}
  # could use ARGF to include stdin
end

