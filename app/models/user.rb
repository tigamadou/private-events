class User < ApplicationRecord
  validates :username, :email, :password, presence: true

  has_secure_password
  has_many :events
  has_many :event_attendees
  has_many :attended_events, class_name: 'Event', through: :event_attendees
end
