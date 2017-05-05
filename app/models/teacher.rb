class Teacher < ApplicationRecord
	has_many :schedules
	def self.search(search)
  where("name LIKE ? OR gender LIKE ? ", "%#{search}%", "%#{search}%") 
end
end
