require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def setup
    @hiking = Activity.new('hiking')
    @bowling = Activity.new('bowling', 10, 2)
    @darts = Activity.new('darts', 5, 0)
    @family_reunion = Reunion.new('Mexico')
    @high_school_reunion = Reunion.new('Austin')
  end

  def test_reunion_has_location
    assert_equal 'Mexico', @family_reunion.location
    assert_equal 'Austin', @high_school_reunion.location
  end

  def test_reunion_has_no_activities_by_default
    assert_equal [], @family_reunion.activities
    assert_equal [], @high_school_reunion.activities
  end

  def test_reunion_can_add_activities
    @family_reunion.add_activity(@hiking)
    assert_equal [@hiking], @family_reunion.activities
    @high_school_reunion.add_activity(@bowling)
    @high_school_reunion.add_activity(@darts)
    assert_equal [@bowling, @darts], @high_school_reunion.activities
  end

  def test_reunion_calculates_total_cost_for_all_activities
    @family_reunion.add_activity(@hiking)
    assert_equal 0, @family_reunion.total_cost

    @high_school_reunion.add_activity(@bowling)
    @high_school_reunion.add_activity(@darts)
    assert_equal 15, @high_school_reunion.total_cost

    @bowling.add_participant('Bart', 0)
    @bowling.add_participant('Lisa', 10)
    @darts.add_participant('Moe', 1)
    @darts.add_participant('Barney', 1)
    assert_equal 19, @high_school_reunion.total_cost
  end
end
