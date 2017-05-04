class AddDobToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :dob, :date
  end
end
