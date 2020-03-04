class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: :user_id
    has_many :event_attendees
    has_many :attendees, class_name: "User", through: :event_attendees

    def self.past
        Event.all.where("date < ?", Time.now)
    end

    def self.upcoming
        Event.all.where("date > ?", Time.now)
    end

    scope :upcoming_events, -> { where("date > ?", Time.now) }
    scope :previous_events, -> { where("date < ?", Time.now) }
end
