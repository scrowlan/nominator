class Nomination < ActiveRecord::Base
  belongs_to :employee, dependent: :delete

  def as_json(options={})
    super(:only => [:reason,:nominator],
      :include => {
        :employee => {:only => [:fname,:lname]}
        }
      )
  end

end
