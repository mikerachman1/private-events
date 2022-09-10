class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :rsvps, foreign_key: :attended_event_id

  has_many :attendees, through: :rsvps

  # def self.past
  #   self.where('date < ?', Date.today).order(:date)
  # end

  # def self.future
  #   self.where('date >= ?', Date.today).order(:date)
  # end 

  scope :past, -> { where('date < ?', Date.today).order(:date) }
  scope :future, -> { where('date >= ?', Date.today).order(:date) }
  
end
