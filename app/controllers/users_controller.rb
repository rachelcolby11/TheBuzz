class UsersController < ApplicationController
  def downgrade 
    current_user.update_attribute(:role, 'standard')
    redirect_to root_path
  end
end