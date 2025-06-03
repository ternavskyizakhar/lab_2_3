ActiveAdmin.register Account do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :balance, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:balance, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :user_id, as: :select, collection: -> { User.pluck(:id, :name) }
  filter :balance
  filter :created_at
  filter :updated_at
end
