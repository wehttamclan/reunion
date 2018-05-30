require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def setup
    @hiking = Activity.new('hiking')
    @bowling = Activity.new('bowling', 10, 2)
  end

  def test_activity_has_a_name
    assert_equal 'hiking', @hiking.name
  end

  def test_activity_has_associated_costs
    assert_equal  0, @hiking.base_cost
    assert_equal  0, @hiking.cost_per_participant
    assert_equal 10, @bowling.base_cost
    assert_equal  2, @bowling.cost_per_participant
  end

  def test_activity_has_no_participants_by_default
    assert_equal 0, @hiking.participants.length
    assert_equal 0, @bowling.participants.length
  end

  def test_activity_can_add_participant
    @hiking.add_participant('Jake', 0)
    assert_equal  1, @hiking.participants.length
    @bowling.add_participant('Peter', 7)
    @bowling.add_participant('Weber', 5)
    assert_equal  2, @bowling.participants.length
  end

  def test_activity_has_total_costs
    @hiking.add_participant('Jake', 0)
    assert_equal  0, @hiking.total_cost
    @bowling.add_participant('Peter', 7)
    @bowling.add_participant('Weber', 5)
    assert_equal 14, @bowling.total_cost
  end

  def test_activity_calculates_fair_share
    @hiking.add_participant('Jake', 0)
    assert_equal 0, @hiking.fair_share
    @bowling.add_participant('Peter', 7)
    @bowling.add_participant('Weber', 5)
    @bowling.add_participant('Dude', 10)
    assert_equal 5.33, @bowling.fair_share
  end

  def test_activity_calculates_what_particpants_owe
    @hiking.add_participant('Jake', 0)
    assert_equal 0, @hiking.fair_share
    @bowling.add_participant('Peter', 7)
    @bowling.add_participant('Weber', 5)
    @bowling.add_participant('Dude', 10)
    assert_equal (-1.67), @bowling.who_owes_what['Peter']
    assert_equal  (0.33), @bowling.who_owes_what['Weber']
    assert_equal (-4.67), @bowling.who_owes_what['Dude']
  end
end
