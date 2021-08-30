class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :meetup, null: false, foreign_key: true

      t.timestamps
    end
  end
end
