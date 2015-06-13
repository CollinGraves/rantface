class RantReverse

  def self.call(body)
    # This needs to be better at catching spaces and punctuation
    str_attrs = body.scan(/.{1,140}/m)

    final_str = []

    str_attrs.reverse.each do |str|
      # Scrub each str for nice presentation
      # Add rant (1!) numbers and link at the end

      # sos = RantReverse::SwapOrderService.call str

      final_str << str
    end

    final_str

  end
end
