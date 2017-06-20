class PropertiesController < ApplicationController

  before_action :check_if_logged_in, only: [:new, :create, :edit, :update, :destroy]

  def new
    @property = Property.new
  end

  def create
    property = Property.new property_params
    property.user = @current_user   # set the owner for this property
    if property.save
      redirect_to  property_path(property)  # "/properties/#{ property.id}"
    else
      # error saving
      render :new
    end
  end

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find params["id"]
  end

  def edit
    @property = Property.find params["id"]
  end

  def update
    property = Property.find params["id"]

    property.update({
      street: params["street"],
      suburb: params["suburb"],
      state: params["state"],
      postcode: params["postcode"],
      description: params["description"]
      })

    redirect_to property_path(property) 
  end

  def destroy
    Property.find( params["id"] ).destroy

    redirect_to properties_path
  end

  private
  def property_params
    params.require(:property).permit(:address, :suburb, :state, :postcode, :description)
  end
end
