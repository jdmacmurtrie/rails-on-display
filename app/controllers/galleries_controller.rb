class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
    @art_pieces = @gallery.art_pieces
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)

    if @gallery.save
      flash[:notice] = "Gallery added successfully"
      redirect_to gallery_path(@gallery)
    else
      flash[:alert] = @gallery.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :city, :state, :zip, :description)
  end
end
