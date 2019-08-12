ActiveAdmin.register Plan do
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
 permit_params :plan_name, :stripe_plan_id, :price, :no_of_days
  form  do |f|
    inputs 'Details' do
      input :plan_name
      input :stripe_plan_id
      input :price
      input :no_of_days
      actions
    end
  end
  index do
    id_column
    column :plan_name
    column :price
    column :stripe_plan_id
    column :no_of_days
    actions
  end
end