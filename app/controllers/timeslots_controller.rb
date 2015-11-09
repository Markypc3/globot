class TimeslotsController < ApplicationController
  def index
    @timeslots = Timeslot.all
  end
  def show
    @timeslot = Timeslot.find(params[:id])
  end
  def new
    @timeslot = Timeslot.new
  end
  def edit
    @timeslot = Timeslot.find(params[:id])
  end
  def create
    @timeslot = Timeslot.new(timeslot_params)
    @timeslot.user = current_user
    if @timeslot.save
      redirect_to "/timeslots/#{@timeslot.id}"
    else
      render :edit
    end
  end
  def update
    @timeslot = Timeslot.find(params[:id])
    if @timeslot && @timeslot.update(timeslot_params)
      redirect_to "/timeslots/#{@timeslot.id}"
    else
      render :edit
    end
  end
  def destroy
    @timeslot = Timeslot.find(params[:id])
    if @timeslot && @timeslot.user == current_user
      @timeslot.destroy
    end
    redirect_to '/timeslots'
  end
  private

  def timeslot_params
    params.require(:timeslot).permit(
      :title,
      :body,
      :image_url,
      :slot_start,
      :slot_end,
      :accepted
    )
  end
end
