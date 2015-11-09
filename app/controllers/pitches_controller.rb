class PitchesController < ApplicationController
  def index
    redirect_to '/'
  end
  def new
    @pitch = Pitch.new
  end
  def create
    @pitch = Pitch.new(pitch_params)
    @pitch.user = current_user
    @pitch.timeslot = Timeslot.find(params[:timeslot_id])
    if @pitch.save
      redirect_to "/timeslots/#{@pitch.timeslot.id}"
    else
      render :new
    end
  end
  def edit
    @pitch = Pitch.find(params[:id])
  end
  def update
    @pitch = Pitch.find(params[:id])
    binding.pry
    if @pitch && @pitch.update(pitch_params)
      redirect_to "/timeslots/#{@pitch.timeslot.id}"
    else
      render :edit
    end
  end
  def accept
    @pitch = Pitch.find(params[:id])
    @pitch.update(accepted: true)
    redirect_to "/timeslots/#{@pitch.timeslot.id}"
  end
  def destroy
    @pitch = Pitch.find(params[:id])
    if @pitch.user == current_user
      @pitch.destroy
      redirect_to "/timeslots/#{params[:timeslot_id]}"
    else
      session[:return_to] ||= request.referer
      redirect_to session.delete(:return_to)
    end
  end
  private

  def pitch_params
    params.require(:pitch).permit(
      :title,
      :body,
      :image_url,
      :timeslot_id,
      :accepted
    )
  end
end
