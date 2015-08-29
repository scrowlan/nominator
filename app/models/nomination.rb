class Nomination < ActiveRecord::Base
  belongs_to :employee
  delegate :full_name, to: :employee

end
