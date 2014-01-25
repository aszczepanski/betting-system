class AddAnswerIdToBets < ActiveRecord::Migration
  def change
    add_column :bets, :answer_id, :integer
  end
end
