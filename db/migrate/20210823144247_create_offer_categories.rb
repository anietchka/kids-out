class CreateOfferCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :offer_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
