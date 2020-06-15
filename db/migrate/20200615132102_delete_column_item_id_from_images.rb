class DeleteColumnItemIdFromImages < ActiveRecord::Migration[6.0]
  remove_column :images, :item_id
end
