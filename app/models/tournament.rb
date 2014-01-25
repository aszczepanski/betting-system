class Tournament < ActiveRecord::Base
  belongs_to :category
  has_many :events
  has_many :bets, :through => :events

  attr_accessible :category_id, :description, :name

  def category_name
    category.name
  end

  def current_rank
    Event.transaction do
      Bet.transaction do
        rank = Hash.new {0}
        sum = 0
        bets.each do |bet|
          if bet.answer_id == bet.correct_answer_id
            sum = sum+1
            rank[bet.user] = rank[bet.user]+1
          else
            rank[bet.user] = rank[bet.user]
          end
        end
        return rank.sort_by {|_key, value| -value}
      end
    end
  end

end
