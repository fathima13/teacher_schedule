class AddGenderToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :gender, :string
  end
end
