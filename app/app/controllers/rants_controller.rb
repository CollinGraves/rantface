class RantsController < ApplicationController
  before_action :set_rant, only: [:show, :edit, :update, :destroy]

  rescue_from Exception, with: :rant_rescue

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

      if current_user.nil?
        flash[:errors] = "You need to log in first"
        render action: :new
        return
      end

      @rant.user_id = current_user.id
      @rant.save

      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end
  end

  private

  def set_rant
    @rant = Rant.find(params[:id])
  end

  def rant_params
    params.require(:rant).permit(:user_id, :body)
  end

  def rant_rescue(e = nil)
    flash[:errors] = e.message if e
    render action: :new
  end

end
