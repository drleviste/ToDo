class ItemsController < ApplicationController

  def new
    @items = Item.new 
  end

  def create
    @id = Item.find(params[:id])
    @item = Item.create(items_params)
    unless @item.valid?
      flash[:error] = @item.errors.full_messages.join("<br>").html_safe
    else
      flash[:success] = "#{params[:category]} added successfully"
    end
    redirect_to checklist_path(@id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def items_params
      params.require(:item).permit(:content, :category, :order)
    end
end