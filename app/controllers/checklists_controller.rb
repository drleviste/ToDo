class ChecklistsController < ApplicationController
  def index
    @checklists = Checklist.all
  end

  def new
    @checklist = Checklist.new
  end

  def create
    @checklist = Checklist.new(checklist_params)
  end

  def edit
    @checklist = Checklist.find(params[:id])
  end

  def update
    @checklist = Checklist.find(params[:id])

    if @checklist.update(checklist_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @checklist = Checklist.find(params[:id])
    @checklist.destroy
    redirect_to checklists_path #save checklist folder in view
  end

  def show
    @checklist = Checklist.find(params[:id])
  end

  private
    def checklist_params
      params.require(:checklist).permit(:title, :description)
    end
end
