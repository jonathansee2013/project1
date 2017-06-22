class ReviewsController < ApplicationController

  before_action :check_if_logged_in, only: [:new, :create, :edit, :update, :destroy]

  def new
    @review = Review.new

  end

  def create
    review = Review.new review_params
    review.user = @current_user
    review.property_id = params[:property_id]

    if review.save
      redirect_to property_path(params[:property_id])
    else
      flash[:error] = "Unable to save review"
      redirect_to property_path(params[:property_id])
    end
  end

  def index
    @reviews = Review.all
  end


  def show
    @review = Review.find params["id"]
  end


  def edit
    @review = Review.find params["id"]
  end

  def update
    review = Review.find params["id"]

    review.update({
      comment: params["comment"],
      rating: params["rating"]
      })

    redirect_to review_path(review)
  end

  def destroy
    Review.find( params["id"] ).destroy

    redirect_to reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
