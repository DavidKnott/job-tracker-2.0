class CategoriesController < ApplicationController
  
  def edit
    @jobs = Job.all
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    if @category.save
      flash[:success] = "#{@category.title} has been successfully updated!"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def new
    @jobs = Job.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} added!"
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def destroy
    category = Category.find(params[:id])

    category.destroy

    flash[:success] = "#{category.title} was successfully deleted!"
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:title, {job_ids: []})
  end
end