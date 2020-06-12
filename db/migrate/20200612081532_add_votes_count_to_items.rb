class AddVotesCountToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :votes_count, :integer, default: 0
  end
end
