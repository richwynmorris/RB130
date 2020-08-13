class BeerSong
  def initialize(beers=99)
    @count = beers
    @song = []
  end

  def verse(verse_number)
    @count = verse_number
    choose_lyric
    @song.join
  end

  def verses(start, finish)
    @count = start
    loop do
      choose_lyric
      break if @count < finish
    end
    @song.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

  def choose_lyric
    case @count
    when 2 then @song << print_two_bottle_verse
    when 1 then @song << print_one_bottle_verse
    when 0 then @song << print_zero_bottle_verse
    else
      @song << print_standard_verse
    end
  end

  def print_standard_verse
    <<~VERSE
    #{@count} bottles of beer on the wall, #{@count} bottles of beer.
    Take one down and pass it around, #{reduce_count} bottles of beer on the wall.
    VERSE
  end

  def print_two_bottle_verse
    <<~VERSE
    #{@count} bottles of beer on the wall, #{@count} bottles of beer.
    Take one down and pass it around, #{reduce_count} bottle of beer on the wall.
    VERSE
  end

  def print_one_bottle_verse
    reduce_count
    <<~VERSE
    1 bottle of beer on the wall, 1 bottle of beer.
    Take it down and pass it around, no more bottles of beer on the wall.
    VERSE
  end

  def print_zero_bottle_verse
    reduce_count
    <<~VERSE
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    VERSE
  end

  def reduce_count
    @count -= 1
  end
end