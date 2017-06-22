class PropertiesController < ApplicationController

  before_action :check_if_logged_in, only: [:new, :create, :edit, :update, :destroy]

  def new
    @property = Property.new
  end

  def create
    # When the form is submitted, all of the things that the user gave us will be added into params
      # We want to restrict the parameters to the stuff that we care about - property_params
      # property_params chooses which data it cares about
    property = Property.new property_params
    # We have a user logged in, so let's make sure that the property is owned by that user
    property.user = @current_user # set the owner for this property
    # If the property is able to be saved
    if property.save
      # All of the images that the user has selected is stored in params["property"]["image"]
        # These files are in there because of a file_field in the form
          # e.g. <%= f.file_field :image, multiple: true %>
      images = params["property"]["image"]
      # Iterate through each one of the files that the user selected
        # Call the current file image
      if images.present?
        images.each do |image|
          # Upload whatever the current image is (e.g. A-01.jpg, A-02.jpg), and save all of the data that comes back from Cloudinary as response
          response = Cloudinary::Uploader.upload image
          # In that response hash, there is a key called secure_url, access that
          url = response["secure_url"]
          # Create a new record in the images database table using the URL that came back from Cloudinary
          img = Image.create url: url
          # Associate that new image with the property that we created above
            # A property has many images, an image belongs to a property. We are saying that for the property that we just created - its collection of images should include whatever we just uploaded
          property.images << img
        end
      end

      redirect_to property_path(property)  # "/properties/#{ property.id}"
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

    property.update property_params
    images = params["property"]["image"]
    # Iterate through each one of the files that the user selected
      # Call the current file image
    if images.present?
      images.each do |image|
        # Upload whatever the current image is (e.g. A-01.jpg, A-02.jpg), and save all of the data that comes back from Cloudinary as response
        response = Cloudinary::Uploader.upload image
        # In that response hash, there is a key called secure_url, access that
        url = response["secure_url"]
        # Create a new record in the images database table using the URL that came back from Cloudinary
        img = Image.create url: url
        # Associate that new image with the property that we created above
          # A property has many images, an image belongs to a property. We are saying that for the property that we just created - its collection of images should include whatever we just uploaded
        property.images << img
      end
    end

    redirect_to property_path(property)
  end

  def destroy
    Property.find( params["id"] ).destroy

    redirect_to user_path(@current_user)
  end

  private
  def property_params
    params.require(:property).permit(:address, :suburb, :state, :postcode, :description)
  end
end
