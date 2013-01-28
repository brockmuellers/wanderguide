class DaysController < ApplicationController
  before_filter :require_user, :except => [:show, :index]
  before_filter :find_day, :except => [:new, :create, :index]
  before_filter :require_ownership, :only => [:edit, :update]

	# GET /days
  # GET /days.json
  def index
    @days = Day.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @days }
    end
  end


  # GET /users/1/days/1
  # GET /users/1/days/1.json
  def show
    @user = @day.trip.user
    @trip = Trip.find(params[:trip_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @day }
    end
  end

  # GET /users/1/days/new
  # GET /users/1/days/new.json
  def new
    @day = Day.new
    @trip = Trip.find(params[:trip_id])
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @day }
    end
  end

  # GET /users/1/days/1/edit
  def edit
  end

  # POST /users/1/days
  # POST /users/1/days.json
  def create
    @user = User.find(params[:user_id])
    @trip = Trip.find(params[:trip_id])
    @day = @trip.days.new(params[:day])

    respond_to do |format|
      if @day.save
        format.html { redirect_to user_trip_day_url(@user, @trip, @day), notice: 'Day was successfully created.' }
        format.json { render json: @day, status: :created, location: @day }
      else
        format.html { render action: "new" }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1/days/1
  # PUT /users/1/days/1.json
  def update
    respond_to do |format|
      if @day.update_attributes(params[:day])
        format.html { redirect_to trip_day_url(@day.trip, @day), notice: 'Day was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end
  
  #
  # Delete the day
  def destroy
    trip = @day.trip
    @day.destroy
    redirect_to user_trip_path(trip.user, trip)
  end

  private

  def find_day
    @day = Day.find(params[:id])
  end

  def require_ownership
    unless @day.trip.user == current_user
      redirect_to root_url, :alert => "You don't own that day."
    end
  end
end
