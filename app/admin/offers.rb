ActiveAdmin.register Offer do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :start_time, :end_time, :title, :status, :min_purchase, :max_discount
  before_action :set_offer, only:[:create, :update]  
  actions :all

  form  do |f|
    inputs 'Details' do
      input :title
      input :start_time, as: :datepicker,
                      datepicker_options: {
                        min_date: "2013-10-8",
                        max_date: "+3D"
                      }
      input :end_time, as: :datepicker,
                    datepicker_options: {
                      min_date: 3.days.ago.to_date,
                      max_date: "+4M"
                    }
      input :status
      input :min_purchase
      input :max_discount
      input :food_items_ids, label: 'Food Item', as: :select, collection: FoodItem.all.collect{|u| [u.name, u.id]}.compact, multiple: true
      actions
    end
  end

  controller do
    def create
      if @offer.save
        flash[:success]="Offer created successfully..!"
      else
        flash[:error]="error try again..!"
      end 
    end

    def update
      if @offer.update_attributes(permitted_params[:offer])
        flash[:success]="Offer updated successfully..!"
      else
        flash[:error]="error try again..!"
      end
    end

    private

    def set_offer
      @offer = Offer.find_by(id: params[:id])|| Offer.new(permitted_params[:offer])
      food_ids = params[:offer][:food_items_ids]
      food_ids.delete_at(0) unless food_ids.empty?
      @offer.food_items_ids = food_ids
    end
  end
end