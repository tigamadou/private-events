class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: :user_id
    has_many :event_attendees
    has_many :attendees, class_name: "User", through: :event_attendees
end
