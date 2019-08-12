ActiveAdmin.register Order do
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
actions :all, except: [:new, :edit, :destroy]
permit_params :ammount,:status,:user_id
  index do
    id_column
    column "User Name" do |order|
      order.user.first_name
    end
    column :ammount
    column :status
    actions
  end

  show do
   render 'order_history'
  end

end
