class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  attr_accessible :bet_date, :event_id, :user_id, :answer_id

  def answer_name
    Answer.find(answer_id).name
  end

  def user_name
    user.username
  end

  def event_name
    event.name
  end

  def tournament
    event.tournament
  end

  def tournament_name
    tournament.name
  end

  def correct_answer_id
    event.correct_answer
  end

end
