ActiveAdmin.register User do
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
permit_params :first_name, :last_name, :contact_no, :address
  index do
    id_column
    column :first_name
    column :last_name
    column :contact_no
    column :address
    actions
  end
end
