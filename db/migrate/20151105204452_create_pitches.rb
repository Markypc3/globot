class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.string :title
      t.string :body
      t.string :image_url
      t.datetime :proposed_time
      t.boolean :accepted
      t.references :user, index: true, foreign_key: true
      t.references :timeslot, index: true, foreign_key: true

      t.timestamps
    end
  end
end
