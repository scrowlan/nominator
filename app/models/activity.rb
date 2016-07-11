class Activity < ActiveRecord::Base

  def as_json(options={})
    super(:only => [:title,:name,:date],
      :methods => [:current],
      )
  end

  def current
    @activities = Activity.where(:created_at => '2016-05-16'.to_date.beginning_of_day..Time.now).reverse
    respond_to do |format|
      format.json { render json: @activities }
      format.html { @activities }
    end
  end
end
