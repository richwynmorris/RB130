class SecretHandshake
  COMMANDS = { 
    10000 => 'reverse',
    1000 => 'jump',
    100 => 'close your eyes',
    10 => 'double blink',
    1 => 'wink'
  }

  def initialize(value)
    value.is_a?(Integer) ? @handshake = value.to_s(2).to_i : @handshake = value.to_i(2)
    @results = []
  end

  def commands
    COMMANDS.each do |key, value|
      number = @handshake / key
      @results << value if number != 0 
      @handshake -= number * key 
    end
    verify_results
  end

  def verify_results
    if @results.include?('reverse')
      @results.delete('reverse')
      @results
    else
      @results.reverse
    end
  end
end