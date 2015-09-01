class Employee < ActiveRecord::Base
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  has_many :nominations

  mount_uploader :employee_image, EmployeeUploader

  before_destroy :destroy_nominations

  def full_name
    "#{fname} #{lname}"
  end

  private
  
    def destroy_nominations
     self.nominations.delete_all   
    end
  
end
