include Amatch
class ConferenceRoom
  SIMILARITY_THRESHOLD = 0.75
  attr_accessor :name, :location

  def initialize(name, location)
    @name = name
    @location = location
  end

  def self.replies_for(raw_query)
    cased_query = raw_query.downcase

    #handle special cases first
    return CONFERENCE_ROOMS.collect { |cr| cr.name.titleize }.join(', ') if cased_query == 'list conference rooms'

    # look it up as a conference room
    conf_room_query = strip_fluff(cased_query)
    matches = close_matches_for(conf_room_query)
    return ["I don't see a room named #{cased_query.titleize}"] if matches.size == 0
    replies = []
    matches.each do |match|
      replies << "#{match.name.titleize} is located #{match.location}."
    end
    return replies
  end

  def self.strip_fluff(str)
    str = str.gsub 'where is', ''
    str = str.gsub '?', ''
  end

  def self.close_matches_for(str)
    matcher = JaroWinkler.new(str)
    results = []
    CONFERENCE_ROOMS.each do |room|
      results << room if matcher.match(room.name) > SIMILARITY_THRESHOLD
    end
    return results
  end
end