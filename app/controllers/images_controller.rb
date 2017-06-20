class ImagesController < ApplicationController

  before_action :check_if_logged_in, only: [:new, :create, :edit, :update, :destroy]

  def new
    @image = Image.new
  end

  def create
    image = Image.new image_params
    image.user = @current_user

    if image.save
      redirect_to image_path(image)
    else
      render :new
    end
  end

  def index
    @images = Image.all
  end

  def show
    @image = Image.find params["id"]
  end

  def edit
    @image = Image.find params["id"]
  end

  def update
    image = Image.find params["id"]

    image.update({
      url: params["url"]
      })

    redirect_to image_path(image)
  end

  def destroy
    Image.find( params["id"] ).destroy

    redirect_to images_path
  end

  private
  def image_params
    params.require(:image).permit(:url)
  end
end
