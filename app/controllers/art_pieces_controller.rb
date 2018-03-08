class ArtPiecesController < ApplicationController
  def new
    @gallery = Gallery.find(params[:gallery_id])
    @art_piece = ArtPiece.new
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @art_piece = ArtPiece.new(art_piece_params)
    @art_piece.gallery = @gallery

    if @art_piece.save
      flash[:notice] = "Painting added successfully"
      redirect_to gallery_path(@gallery)
    else
      flash[:alert] = @art_piece.errors.full_messages.to_sentence
      render :new 
   end
  end

  private

  def art_piece_params
    params.require(:art_piece).permit(:title, :year, :artist)

  end
end
