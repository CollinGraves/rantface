class RantReverse

  def self.call(body)
    # This needs to be better at catching spaces and punctuation

    # Additionally, we need to inject a @nickname at the beginning of each
      # rant if the rant is directed at someone. FML.
      # Plan on that whole parsing thing to be a new service.

    str_attrs        = body.strip.scan(/.{1,135}/m)
    number_of_blocks = str_attrs.count
    final_str        = []

    inject = RantReverse::InjectRantNumber.new number_of_blocks

    str_attrs.reverse.each do |str|
      # Scrub each str for nice presentation
      # Add rant (1!) numbers and link at the end

      sos = inject.call str
      final_str << sos

    end

    final_str
  end
end
