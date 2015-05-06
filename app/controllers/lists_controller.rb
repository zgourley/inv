class ListsController < ApplicationController
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

end
