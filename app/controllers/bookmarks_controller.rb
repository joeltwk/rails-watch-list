class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  before_action :set_bookmark, only: %i[destroy]
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(%i[comment list_id movie_id])
  end
end
