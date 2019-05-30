class ThemesController < ApplicationController
  before_action :authorize, only: %i[new create edit update destory]
  before_action :admin_user, only: %i[edit update destroy]

  def index
    @themes = Theme.all
  end

  def new
    @theme = Theme.new
  end
  
  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      redirect_to @theme, success: 'テーマを作成しました'
    else
      render :new
    end
  end

  def show
    @theme = Theme.find(params[:id])
    @codes = Code.joins(:code_time).eager_load(:code_time).where(theme_id: @theme.id).order(:time)
  end

  def edit
    @theme = Theme.find(params[:id])
  end

  def update
    @theme = Theme.find(params[:id])
    if @theme.update(theme_params)
      redirect_to @theme, success: "Theme updated"
    else
      render :edit
    end
  end

  def destroy
    Theme.find(params[:id]).destroy
    redirect_to root_path, success: "Theme deleted"
  end

  private

  def theme_params
    params.require(:theme).permit(:title, :body)
  end
end
