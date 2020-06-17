class AddColumnTotalToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :total, :float
  end
end
