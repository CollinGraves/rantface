class RantReverse
  class InjectRantNumber
    def initialize(number_of_blocks)
      @total_number = number_of_blocks
      @counter = number_of_blocks
    end

    def call(str)
      finished_str = add_trailing_space str

      finished_str.concat "(!#{@counter}/#{@total_number})"

      @counter -= 1

      finished_str
    end

    def add_trailing_space(str)
      str = str.center(str.length+1) if str[-1] != ' '
    end

  end
end

