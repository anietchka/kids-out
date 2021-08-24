class UpdateBookmark < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookmarks, :offer, :string
    remove_column :bookmarks, :references, :string
    add_reference :bookmarks, :offer, foreign_key: true
  end
end
