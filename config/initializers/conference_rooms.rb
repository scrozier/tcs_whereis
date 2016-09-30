CONFERENCE_ROOMS = Rails.configuration.x.conference_rooms.collect { |cr| ConferenceRoom.new(cr.first, cr.last) }
