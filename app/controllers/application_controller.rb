class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  responders :flash
  helper_method :namespace, :first_encounter_date, :first_encounter_price, :tango_from_zero_date, :tango_from_zero_price

  def namespace
    names = self.class.to_s.split('::')
    return "null" if names.length < 2
    names[0..(names.length-2)].map(&:downcase).join('_')
  end

  def first_encounter_date
    DateTime.parse("2015-09-18 20:00:00")
  end

  def first_encounter_price
    50.0
  end

  def tango_from_zero_date
    DateTime.parse("2015-09-26 15:00:00")
  end

  def tango_from_zero_price
    100.0
  end

end
