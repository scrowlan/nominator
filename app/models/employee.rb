class Employee < ActiveRecord::Base
  has_many :nominations

  mount_uploader :employee_image, EmployeeUploader
  
end
