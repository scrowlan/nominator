class NominationsController < ApplicationController
  before_action :set_nomination, only: [:show, :edit, :update, :destroy]
  invisible_captcha only: [:create, :update], honeypot: :subtitle
  
  # GET /nominations
  # GET /nominations.json
  def index
    @nominations = Nomination.where(:created_at => '2016-11-02'.to_date.beginning_of_day..Time.now).reverse
    respond_to do |format|
      format.json { render json: @nominations }
      format.html { @nominations }
    end
  end

  # GET /nominations/1
  # GET /nominations/1.json
  def show
  end

  # GET /nominations/new
  def new
    @nomination = Nomination.new
  end

  # GET /nominations/1/edit
  def edit
  end

  # POST /nominations
  # POST /nominations.json
  def create
    @nomination = Nomination.new(nomination_params)
    @nomination.employee = Employee.friendly.find(params[:employee_id])

    respond_to do |format|
      if @nomination.save
        format.html { redirect_to nominations_path, notice: 'Nomination was successfully created.' }
        format.json { render :show, status: :created, location: @nomination }
      else
        format.html { render :new }
        format.json { render json: @nomination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nominations/1
  # PATCH/PUT /nominations/1.json
  def update
    respond_to do |format|
      if @nomination.update(nomination_params)
        format.html { redirect_to @nomination, notice: 'Nomination was successfully updated.' }
        format.json { render :show, status: :ok, location: @nomination }
      else
        format.html { render :edit }
        format.json { render json: @nomination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nominations/1
  # DELETE /nominations/1.json
  def destroy
    @nomination = Nomination.find(params[:id])
    @nomination.destroy
    respond_to do |format|
      format.html { redirect_to nominations_url, notice: 'Nomination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def count_by_employee(employee_id)

    @count_by_employee = Nomination.where(employee_id: params[:employee_id]).count

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nomination
      @nomination = Nomination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nomination_params
      params[:nomination].permit(:reason, :nominator, :employee_id)
    end
end
