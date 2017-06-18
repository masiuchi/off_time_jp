require 'test_helper'

require 'date'
require 'holiday_jp'

class OffTimeJpTest < Minitest::Test
  def teardown
    Timecop.return
  end

  def test_that_it_has_a_version_number
    refute_nil ::OffTimeJp::VERSION
  end

  def test_initialize
    assert_raises(NoMethodError) do
      OffTimeJp.new(DateTime.now)
    end
  end

  def test_off_time_on_saturday
    datetime = DateTime.new(2017, 6, 17, 9, 30, 00, '+09:00')
    assert datetime.saturday?
    assert OffTimeJp.off_time?(datetime)
  end

  def test_off_time_on_sunday
    datetime = DateTime.new(2017, 6, 18, 9, 30, 00, '+09:00')
    assert datetime.sunday?
    assert OffTimeJp.off_time?(datetime)
  end

  def test_off_time_on_holiday
    datetime = DateTime.new(2017, 7, 17, 9, 30, 00, '+09:00')
    assert HolidayJp.holiday?(datetime.to_date)
    assert OffTimeJp.off_time?(datetime)
  end

  def test_off_time_at_midnight
    datetime = DateTime.new(2017, 6, 19, 23, 30, 00, '+09:00')
    assert OffTimeJp.off_time?(datetime)

    datetime = DateTime.new(2017, 6, 20, 1, 30, 00, '+09:00')
    assert OffTimeJp.off_time?(datetime)
  end

  def test_off_time_on_weekday_at_day_time
    datetime = DateTime.new(2017, 6, 19, 9, 30, 00, '+09:00')
    assert datetime.monday?
    refute OffTimeJp.off_time?(datetime)
  end

  def test_off_time_in_not_jst
    datetime = DateTime.new(2017, 6, 19, 21, 00, 00, '+06:00')
    assert OffTimeJp.off_time?(datetime)
  end

  def test_off_time_without_argument_at_off_time
    Timecop.freeze(DateTime.new(2017, 6, 17, 9, 30, 00, '+09:00'))
    assert OffTimeJp.off_time?
  end

  def test_off_time_without_argument_on_weekday_at_day_time
    Timecop.freeze(DateTime.new(2017, 6, 19, 9, 30, 00, '+09:00'))
    refute OffTimeJp.off_time?
  end
end

