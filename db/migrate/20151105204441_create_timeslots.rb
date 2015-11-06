class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.string :title
      t.string :body
      t.string :image_url
      t.datetime :slot_start
      t.datetime :slot_end
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
