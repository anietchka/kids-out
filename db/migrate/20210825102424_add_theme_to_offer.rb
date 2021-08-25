class AddThemeToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :theme, :string
  end
end
