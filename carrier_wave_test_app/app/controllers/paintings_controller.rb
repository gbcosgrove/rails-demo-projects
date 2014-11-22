class PaintingsController < ApplicationController

  def new
    @painting = Painting.new(:gallery_id => params[:gallery_id])
  end

  def create
    @painting = Painting.create(painting_params)
    if @painting.save
      flash[:notice] = "Successfully Created Painting."
      redirect_to @painting.gallery
    else
      render 'new'
    end
  end

  def edit
    @painting = Painting.find(params[:id])
  end

  def update
    @painting = Painting.find(params[:id])
    @painting.update(painting_params)

    flash[:notice] = 'Book Updated'
    redirect_to @gallery
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
    flash[:notice] = "Successfully destroyed painting"
    redirect_to @painting.gallery
  end

  private

  def painting_params
    params.require(:painting).permit(:name, :gallery_id, :image)
  end
end
