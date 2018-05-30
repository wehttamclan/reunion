class Reunion
  attr_reader :location, :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.inject(0) do |cost, activity|
      cost + activity.total_cost
    end
  end
end
