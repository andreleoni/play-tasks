class TimeSheetsController < ApplicationController
  before_action :set_time_sheet, only: [:show, :edit, :update, :destroy]

  def index
    @time_sheets = TimeSheet.all
  end

  def show
  end

  def new
    @time_sheet = TimeSheet.new
  end

  def edit
  end

  def create
    @time_sheet = TimeSheet.new(time_sheet_params)

    respond_to do |format|
      if @time_sheet.save
        format.html { redirect_to @time_sheet, notice: 'Time sheet was successfully created.' }
        format.json { render :show, status: :created, location: @time_sheet }
      else
        format.html { render :new }
        format.json { render json: @time_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @time_sheet.update(time_sheet_params)
        format.html { redirect_to @time_sheet, notice: 'Time sheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_sheet }
      else
        format.html { render :edit }
        format.json { render json: @time_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @time_sheet.destroy
    respond_to do |format|
      format.html { redirect_to time_sheets_url, notice: 'Time sheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_time_sheet
      @time_sheet = TimeSheet.find(params[:id])
    end

    def time_sheet_params
      params.require(:time_sheet).permit(:hours, :comment, :project_id, :task_id)
    end
end
