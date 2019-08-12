class WelcomesController < ApplicationController
  before_action :authenticate_user!, :except => [:index,:about_us,:contact_us]
  def index

  end

  def about_us
  end

  def contact_us

  end

  def send_message
    message = SendMessage.new(contact_params)
    if message.save
      flash[:success] = 'Message has sent successfully.'
      redirect_to contact_us_path
    else
      flash[:error] = 'Somthing went wrong try again..'
    end 
  end

  def menu
    @categories = Category.includes(:food_items)
  end

  private

  def contact_params
    params.require(:contact).permit(:message, :name, :email, :subject)
  end
end
