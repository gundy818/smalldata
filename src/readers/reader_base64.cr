
require "./reader"

module Smalldata::Readers
  class Base64 < Smalldata::Readers::Base
    getter name : String = "Base64"
    getter key : String = "base64"

    def next
      stop
    end
  end
end

