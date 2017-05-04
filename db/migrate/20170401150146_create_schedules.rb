class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.string :branch
      t.integer :semester
      t.string :day
      t.string :section
      t.string :time
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
