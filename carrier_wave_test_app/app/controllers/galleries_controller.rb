class GalleriesController < ApplicationController

  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.create(gallery_params)
    if @gallery.save
      flash[:notice] = "Successfully Created Gallery"
      redirect_to @gallery
    else
      render 'new'
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end


  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(params[:gallery])
      flash[:notice] = "Successfully updated gallery"
      redirect_to gallery_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    flash[:notice] = "Successfully destroyed gallery."
    redirect_to galleries_url
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :gallery_id)
  end
end
