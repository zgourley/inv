class ItemsController < ApplicationController


  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new 
  end

  def create
    @list = List.find(params[:id])
    @item = Item.new(params.require(:item).permit(:item_name, :kind, :description, :weight))
    @item.list = @list

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

    if @item.update_attributes(params.require(:item).permit(:item_name, :kind, :description, :weight))
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

end