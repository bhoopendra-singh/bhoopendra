class OffersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
	def index
   @offers = Offer.all
	end
  
  def show
    @offer = Offer.find_by(id: params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def offer_params
    params.require(:offers).permit(:start_time, :end_time, :title, :status, :discount, :min_purchase, :max_discount)
  end
end
