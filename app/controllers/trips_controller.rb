class TripsController < ApplicationController
  before_filter :require_user, :except => [:show, :index]
  before_filter :find_trip, :except => [:new, :create, :index]
  before_filter :require_ownership, :only => [:edit, :update]

	# GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end


  # GET /users/1/trips/1
  # GET /users/1/trips/1.json
  def show
    @user = @trip.user
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /users/1/trips/new
  # GET /users/1/trips/new.json
  def new
    @trip = Trip.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /users/1/trips/1/edit
  def edit
  end

  # POST /users/1/trips
  # POST /users/1/trips.json
  def create
    @trip = Trip.new(params[:trip])
    @trip.user = current_user

    respond_to do |format|
      if @trip.save
        format.html { redirect_to user_trip_url(@trip.user, @trip), notice: 'Trip was successfully created.' }
        format.json { render json: @trip, status: :created, location: @trip }
      else
        format.html { render action: "new" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1/trips/1
  # PUT /users/1/trips/1.json
  def update
    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to user_trip_url(@trip.user, @trip), notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end
  

  #
  # Delete the trip
  def destroy
    user = @trip.user
    @trip.destroy
    redirect_to user_path(user)
  end

  private

  def find_trip
    @trip = Trip.find(params[:id])
  end

  def require_ownership
    unless @trip.user == current_user
      redirect_to root_url, :alert => "You don't own that trip."
    end
  end

end
