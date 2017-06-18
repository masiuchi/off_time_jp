require "off_time_jp/version"

require "date"
require "holiday_jp"

class OffTimeJp
  private_class_method :new

  class << self
    def off_time?(datetime=nil)
      datetime ||= DateTime.now
      new(datetime).off_time?
    end
  end

  def off_time?
    day_off? || holiday? || midnight?
  end

  private

  def initialize(datetime)
    @datetime = datetime
  end

  def day_off?
    @datetime.saturday? || @datetime.sunday?
  end

  def holiday?
    HolidayJp.holiday?(@datetime.to_date)
  end

  def midnight?
    @datetime.hour <= 5 && @datetime.hour >= 22
  end
end
