class ConferenceRoom
  attr_accessor :name, :location

  def initialize(name, location)
    @name = name
    @location = location
  end

  def self.reply_for(query)
    #handle special cases first
    return CONFERENCE_ROOMS.collect { |cr| cr.name.titleize }.join(', ') if query == 'list conference rooms'

    # look it up as a conference room
    matches = CONFERENCE_ROOMS.select { |cr| cr.name.downcase == query.downcase }
    return "I don't see a room named #{query.titleize}" if matches.size == 0
    raise "Multiple matches for #{query.downcase}" if matches.size > 1
    "#{query} is located #{matches.first.location}"
  end
end