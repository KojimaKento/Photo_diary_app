class PhotosController < ApplicationController
  def index
    @photos = Photo.includes(:user).order("created_at DESC")
    @users = User.all
  end

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new
    @comments = @photo.comments.includes(:user)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    @photo.save
    redirect_to photo_path(@photo)
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to photo_path(@photo)
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :body, :image)
  end
end
