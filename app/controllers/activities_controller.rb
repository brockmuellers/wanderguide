class ActivitiesController < ApplicationController
  before_filter :require_user, :except => [:show, :index]
  before_filter :find_activity, :except => [:new, :create, :index]
  before_filter :require_ownership, :only => [:edit, :update]

	# GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activities }
    end
  end


  # GET /users/1/activities/1
  # GET /users/1/activities/1.json
  def show
    @activity = Activity.find(params[:activity_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /users/1/activities/new
  # GET /users/1/activities/new.json
  def new
    @activity = Activity.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /users/1/activities/1/edit
  def edit
  end

  # POST /users/1/activities
  # POST /users/1/activities.json
  def create
    @trip_element = find_trip_element
    @activity = @trip_element.activities.new(params[:activity])

    respond_to do |format|
      if @activity.save 
        if @trip_element.kind_of? Trip
          format.html { redirect_to user_trip_activity_url(@user, @trip_element, @activity), notice: 'Activity was successfully created.' }
          format.json { render json: @activity, status: :created, location: @activity }
        else @trip_element.kind_of? Day
          trip = @trip_element.trip
          format.html { redirect_to user_trip_day_activity_url(@user, trip, @trip_element, @activity), notice: 'Activity was successfully created.' }
          format.json { render json: @activity, status: :created, location: @activity }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1/activities/1
  # PUT /users/1/activities/1.json
  def update
    respond_to do |format|
      if @activity.update_attributes(params[:activity]) 
        if @trip_element.kind_of? Trip
          format.html { redirect_to user_trip_activity_url(@user, @trip_element, @activity), notice: 'Activity was successfully updated.' }
          format.json { head :no_content }
        else 
          format.html { redirect_to user_trip_day_activity_url(@user, trip, @trip_element, @activity), notice: 'Activity was successfully updated.' }
          format.json { head :no_content }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end
  
  #
  # Delete the activity
  def destroy
    @activity.destroy
    if @trip_element.kind_of? Trip
      redirect_to user_trip_path(@user, @trip_element)
    else
      redirect_to user_trip_day_path(@user, @trip_element.trip, @trip_element)
    end
  end

  private

  def find_activity
    @activity = Activity.find(params[:id])
    @trip_element = @activity.trip_element
    @user = @trip_element.find_user
  end
  
  def find_trip_element
    params.each do |name, value|
      if name == "trip_id"
        @trip_element = Trip.find(value)
      end
      if name == "day_id"
        @trip_element = Day.find(value)
      end
    end
    @user = @trip_element.find_user
    nil
  end

  def require_ownership
    unless @activity.find_user == current_user
      redirect_to root_url, :alert => "You don't own that activity."
    end
  end
end
