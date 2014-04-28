class ItemsController < ApplicationController

  def new
    @items = Item.new 
  end

  def create
    @id = Checklist.find(params[:checklist_id])
    @item = @id.items.create(items_params)
    unless @item.valid?
      flash[:error] = @item.errors.full_messages.join("<br>").html_safe
    else
      flash[:success] = "#{params[:category]} added successfully"
    end
    redirect_to checklist_path(@id)
  end

  def edit
    @checklist = Checklist.find(params[:checklist_id])
    @item = @checklist.items.find(params[:id])
  end

  def update
    @checklist = Checklist.find(params[:checklist_id])
    @item = @checklist.items.find(params[:id]).update(items_params)
    if @item
      redirect_to @checklist
    else
      render 'edit'
    end
  end

  def destroy
    @checklist = Checklist.find(params[:checklist_id])
    @item = @checklist.items.find(params[:id]).destroy
    redirect_to @checklist
  end

  def complete   
    @checklist = Checklist.find(params[:checklist_id])
    if params[:items_checkbox].present?
      Item.where(id: params[:items_checkbox]).update_all(is_complete: true)
      Item.where('id not in (?)', params[:items_checkbox]).update_all(is_complete: false)
    else
      Item.update_all(is_complete: false)
    end
    
    redirect_to @checklist

    end

  private
    def items_params
      params.require(:item).permit(:content, :category, :order)
    end
end