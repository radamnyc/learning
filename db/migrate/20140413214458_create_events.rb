class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :event_date
      t.string :description
      t.string :quisine
      t.decimal :suggested_donation
      t.int :max_participants

      t.timestamps
    end
  end
end
