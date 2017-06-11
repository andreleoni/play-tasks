class Api::V0::TimeSheetsController < ApplicationController
  before_action :set_time_sheet, only: [:show, :edit, :update, :destroy]

  def index
    @time_sheets = TimeSheet.all
    render json: @time_sheets
  end

  def show
      render json: @time_sheet
  end

  def create
    @time_sheet = TimeSheet.new(time_sheet_params)

    if @time_sheet.save
      render json: { time_sheet: @time_sheet, message: "Apontamento criado com sucesso" }
    else
      response.status = 422
      render json: { time_sheet: @time_sheet, message: "Ocorreu um erro ao criar o apontamento" }
    end
  end

  def update
    if @time_sheet.update(time_sheet_params)
      render json: { time_sheet: @time_sheet, message: "Apontamento atualizado com sucesso" }
    else
      render json: { time_sheet: @time_sheet.errors, message: "Ocorreu um erro ao atualizar o apontamento" }
    end
  end

  def destroy
    if @time_sheet.destroy
      render json: { message: "Apontamento excluido com sucesso" }
    else
      render json: { message: "Erro ao excluir o apontamento" }
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
