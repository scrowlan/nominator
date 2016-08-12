class Nomination < ActiveRecord::Base
  belongs_to :employee, dependent: :delete

  def as_json(options={})
    super(:only => [:reason,:nominator,:employee_id],
      :methods => [:count_by_employee],
      :include => {
        :employee => {:only => [:fname,:lname]}
                }
      )
  end

  def count_by_employee

    @count_by_employee = Nomination.where(employee_id: employee_id, :created_at => '2016-08-10'.to_date.beginning_of_day..Time.now).count

  end

end
