class LocationsController < ApplicationController
  before_action :authenticate_restaurant!, except:[:index]
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :owned_location, only: [:edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    # Checks if restaurant owner is signed in
    if restaurant_signed_in?
      # Show current logged in restaurant owner only his location
      @locations = current_restaurant.locations
    # checks if user is signed in
    elsif user_signed_in?
      # Show all locations available
      @locations = Location.all
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = current_restaurant.locations.build
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = current_restaurant.locations.build(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:restaurant_name, :restaurant_phone_number, :restaurant_address, :about, :contact_email, :website, :facebook, :instagram, :accept_takeout)
    end

    def owned_location
     unless @location.restaurant_id == current_restaurant.id
      flash[:notice] = 'Access denied as you are not owner of this location'
      redirect_to root_path
     end
    end


end
