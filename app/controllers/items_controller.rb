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
    @item = Item.create(params.require(:item).permit(:item_name, :kind, :description, :weight))

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
      redirect_to items_path
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