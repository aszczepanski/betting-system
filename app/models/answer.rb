class Answer < ActiveRecord::Base
  belongs_to :event
  attr_accessible :event_id, :name

  def tournament_name
    event.tournament.name
  end

  def event_name
    event.name
  end
end
