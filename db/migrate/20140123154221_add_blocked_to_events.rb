class AddBlockedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :blocked, :boolean
  end
end
