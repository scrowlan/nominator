class Employee < ActiveRecord::Base
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  has_many :nominations

  mount_uploader :employee_image, EmployeeUploader

  before_destroy :destroy_nominations

  def as_json(options={})
    if count_by_employee != 0
      super(:only => [:fname,:lname,:id],
        :methods => [:count_by_employee,:full_name]
        )
    else
      super(:only => [:fname,:lname,:id])
    end
  end

  def count_by_employee
    @count_by_employee = Nomination.where(employee_id: id, :created_at => '2015-10-07'.to_date.beginning_of_day..Time.now).count

  end 


  def full_name
    "#{fname} #{lname}"
  end

  private
  
    def destroy_nominations
     self.nominations.delete_all   
    end
  
end
