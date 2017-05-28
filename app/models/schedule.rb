class Schedule < ApplicationRecord
  belongs_to :teacher
    validates_uniqueness_of :teacher_id, scope: [:day, :time] 
  end
