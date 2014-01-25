class AddExpirationDateAnd < ActiveRecord::Migration
  def up
    add_column :events, :expiration_date, :datetime
    add_column :events, :correct_answer, :integer
  end

  def down
    remove_column :events, :expiration_date
    remove_column :events, :correct_answer
  end
end
