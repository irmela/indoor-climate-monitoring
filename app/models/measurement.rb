class Measurement
  include Mongoid::Document

  field :timestamp_day, type: Date
  field :location, type: String
  field :results, type: Hash

  validates :timestamp_day, presence: true
  validates :location, presence: true
  validates :results, presence: true
end
