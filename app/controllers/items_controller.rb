class ItemsController < ApplicationController
  before_action :require_login, except: [:new, :create]


  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = current_user.items.new 
  end

  def create
    @list = List.current_list
    @item = @list.items.new(item_params)

    if @item.save
      redirect_to items_path

    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(item_params)
      redirect_to lists_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

private

  def item_params
    params.require(:item).permit(:user_id, :item_name, :kind, :description, :weight)
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access that page."
      redirect_to login_path
    end
  end

end