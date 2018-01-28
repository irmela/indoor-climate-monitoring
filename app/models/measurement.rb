class Measurement
  include Mongoid::Document

  field :timestamp_day, type: Date
  field :location, type: String
  field :results, type: Hash, default: {}

  validates :timestamp_day, presence: true
  validates :location, presence: true

  def add_result(params)
    current_time = Time.current
    current_hour = current_time.hour
    current_minute = current_time.min

    results[current_hour.to_s] ||= {}

    results[current_hour.to_s][current_minute.to_s] = {
      temperature: params[:temperature],
      humidity: params[:humidity]
    }

    save!
  end
end
