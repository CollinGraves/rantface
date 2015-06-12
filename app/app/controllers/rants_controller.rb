class RantsController < ApplicationController
  before_action :set_rant, only: [:show, :edit, :update, :destroy]

  def index
    @rants = Rant.all
  end

  def show
  end

  def new
    @rant = Rant.new
  end

  def create
    begin
      @rant = Rant.new(rant_params)
      @rant.user_id = current_user.id
      @rant.save

      respond_to do |format|
        format.html { redirect_to root_path }
      end

      rescue Twitter::Error => e
        flash[:errors] = e.message
        redirect_to new_rant_path
      return
    end
  end

  private

  def set_rant
    @rant = Rant.find(params[:id])
  end

  def rant_params
    params.require(:rant).permit(:user_id, :body)
  end

end
