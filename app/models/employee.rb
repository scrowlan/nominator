class Employee < ActiveRecord::Base
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  has_many :nominations

  mount_uploader :employee_image, EmployeeUploader

  def full_name
    "#{fname} #{lname}"
  end
  
end
