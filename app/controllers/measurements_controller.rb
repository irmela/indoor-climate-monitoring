class MeasurementsController < ApplicationController
  def index
    @measurements = Measurement.all.map { |measurement| measurement }
    render json: @measurements
  end

  def create
    find_measurement

    if @measurement.add_result(measurement_params)
      render json: measurement_params, status: :created
    else
      render json: measurement_params, status: :failed
    end
  end

  private

  def existing_measurement
    Measurement.where({ timestamp_day: Date.current, location: measurement_params[:location] }).first
  end

  def build_measurement
    Measurement.new({
      timestamp_day: Date.current,
      location: measurement_params[:location]
    })
  end

  def find_measurement
    @measurement ||= (existing_measurement || build_measurement)
  end

  def measurement_params
    params.permit(:location, :temperature, :humidity)
  end
end
