class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  scope :visible_to, -> (user) { user && ((user.role == 'premium') || (user.role == 'admin')) ? all : where((private == false) || (private == nil))  }

  def collaborator_for(user)
    collaborators.where(user: user).first
  end

end

