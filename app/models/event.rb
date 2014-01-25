class Event < ActiveRecord::Base
  belongs_to :tournament
  has_many :answers
  has_many :bets
  has_many :users, :through => :bets

  attr_accessible :description, :name, :tournament_id, :expiration_date, :correct_answer, :blocked

  def tournament_name
    tournament.name
  end

  def correct_answer_name
    Answer.find(correct_answer).name
  end
end
