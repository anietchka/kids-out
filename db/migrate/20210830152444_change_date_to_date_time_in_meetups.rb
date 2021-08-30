class ChangeDateToDateTimeInMeetups < ActiveRecord::Migration[6.0]
  def change
    change_column :meetups, :date, :datetime
  end
end
