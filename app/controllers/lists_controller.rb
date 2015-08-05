class ListsController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def index
    @list = List.all
  end

  def show
    @list = List.find(params[:id])
    @item = Item.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params.require(:list).permit(:campaign, :character))

    if @list.save
      redirect_to lists_path
    else
      render :new
      
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to list_path
  end

private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access that page."
      redirect_to login_path
    end
  end
end
