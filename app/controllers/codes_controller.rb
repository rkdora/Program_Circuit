class CodesController < ApplicationController
  before_action :authorize, only: %i[new create destroy]

  def index
    @codes = Code.all
  end

  def new
    @code = Code.new
  end

  def create
    @code = current_user.codes.build(code_params)
    @code.theme_id = params[:theme_id]
    if @code.save
      redirect_to @code, success: '提出に成功しました'
    else
      render 'new'
    end
  end

  def show
    @code = Code.find(params[:id])
  end

  def destroy
    Code.find(params[:id]).destroy
    flash[:success] = "Code deleted"
    redirect_to root_path
  end

  private

  def code_params
    params.require(:code).permit(:content)
  end
end
