class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :meeting_start
      t.datetime :meeting_end
      t.references :timeslot, index: true, foreign_key: true
      t.references :pitch, index: true, foreign_key: true
      

    end
  end
end
