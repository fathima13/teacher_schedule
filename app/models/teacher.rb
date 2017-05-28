class Teacher < ApplicationRecord

  GENDERS = [ "male", "female" ]
  ORDER_BY_FIELDS = [ "name", "dob", "gender" ]
  ORDER_BY = [ "Asc", "Desc" ]

	has_many :schedules

	def self.search params
    teachers = self
    if params[:q].present?
      teachers = teachers.where("name ilike ?", "%#{params[:q]}%")
    end
    if params[:start_date].present?
      teachers = teachers.where("dob >= ?", params[:start_date])
    end
    if params[:end_date].present?
      teachers = teachers.where("dob <= ?", params[:end_date])
    end
    if params[:order_by_field].present?
      order_by = params[:order_by] || "asc"
      order_by_field = params[:order_by_field]
      teachers = teachers.order("#{order_by_field} #{order_by}")
    end
    teachers.all
  end
end
