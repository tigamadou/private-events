class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: :user_id
    has_many :event_attendees
    has_many :attendees, class_name: "User", through: :event_attendees
    validates :name, :description, :date, :venue, presence: true
    # def self.past
    #     Event.all.where("date < ?", Time.now)
    # end

    # def self.upcoming
    #     Event.all.where("date > ?", Time.now)
    # end

    scope :upcoming, -> { where("date > ?", Time.now) }
    scope :past, -> { where("date < ?", Time.now) }

    scope :upcoming_events, -> { where("date > ?", Time.now) }
    scope :previous_events, -> { where("date < ?", Time.now) }
end