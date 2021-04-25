
module Smalldata::Readers
  class Base
    include Iterator(Bytes)

    getter name : String = "Base"
    getter key : String = "base"
    getter data_in : IO
    getter start_pos : (Int32 | Int64)

    def initialize(@data_in : IO)
      @start_pos = @data_in.pos
    end

    def next
      stop
    end

    def rewind()
      @data_in.pos = @start+pos
    end
  end
end

