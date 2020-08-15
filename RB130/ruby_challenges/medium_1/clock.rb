class Clock
  def initialize(hour, minutes) 
    @time = Time.new(2020, nil, nil, hour, minutes, nil)
  end

  def self.at(hour, minutes=nil)
    self.new(hour, minutes)
  end

  def self.copy(time)
    new(time.hour, time.min)
  end

  def +(min)
    Clock.copy(@time + min*60)
  end

  def -(min)
    Clock.copy(@time - min*60)
  end

  def ==(other)
    self.to_s == other.to_s
  end

  def to_s
    @time.strftime("%H:%M")
  end
end
