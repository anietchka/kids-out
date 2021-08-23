class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :name
      t.string :address
      t.string :url
      t.date :start_date
      t.date :end_date
      t.boolean :permanent
      t.text :description
      t.integer :min_age
      t.integer :max_age
      t.string :schedule
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
