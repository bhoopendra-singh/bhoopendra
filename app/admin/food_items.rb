ActiveAdmin.register FoodItem do
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
permit_params :name,:price,:description,:category_id,:photo
  index do
    id_column
    column :name
    column :price
    column :description
    column :category
    column "Image" do |food_item|
      image_tag food_item.photo.thumb.url if food_item.photo.present?
    end
  end
end
