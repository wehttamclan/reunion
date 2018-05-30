class Activity
  attr_reader :name, :base_cost, :cost_per_participant, :participants

  def initialize(name, base_cost=0, cost_per_participant=0)
    @name      = name
    @base_cost = base_cost
    @cost_per_participant = cost_per_participant
    @participants     = Hash.new
    # @who_owes_what = Hash.new
  end

  def add_participant(name, amount_paid)
    @participants[name] = amount_paid
  end

  def total_cost
    @base_cost + (@cost_per_participant*@participants.length).to_f
  end

  def fair_share
    (total_cost/(@participants.length)).round(2)
  end

  def who_owes_what
    @participants.merge(@participants) do |name, paid|
      (fair_share - paid).round(2)
    end
  end
end
