class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.find_by(user_id: current_user.id)
  end
  def show
    @appointment = Appointment.find(params[:id])
  end
  def new
    @appointment = Appointment.new
  end
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.pitch_id = Pitch.find(params[:pitch_id]).id
    @appointment.timeslot = Timeslot.find(params[:timeslot_id])
    if @appointment.save
      redirect_to "/timeslots/#{@appointment.timeslot.id}"
    else
      render :new
    end
  end
  def edit
    @appointment = Appointment.find(params[:id])
  end
  def update
    @appointment = Appointment.find(params[:id])
    if @appointment && @appointment.update(appointment_params)
      redirect_to "/timeslots/#{@appointment.timeslot.id}"
    else
      render :edit
    end
  end
  def destroy
    @appointment = Appointment.find(params[:id])
    if @appointment && @appointment.timeslot.user == current_user
      @appointment.destroy
    end
      redirect_to "/timeslots/#{params[:timeslot_id]}"
  end

  private

  def appointment_params
    params.require(:appointment).permit(
      :meeting_start,
      :meeting_end
    )
  end
end
