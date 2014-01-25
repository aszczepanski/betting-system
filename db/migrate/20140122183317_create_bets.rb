class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :user_id
      t.integer :event_id
      t.datetime :bet_date

      t.timestamps
    end
  end
end
