class UsersController < ApplicationController
  def downgrade 
    current_user.update_attribute(:role, 'standard')
    
    current_user.wikis.each do |wiki|
      wiki.update_attribute(:private, false)
    end
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :role)
    end 
end