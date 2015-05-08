class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :wikis 

  after_initialize :set_role

 def admin?
   role == 'admin'
 end
 
 def premium?
   role == 'premium'
 end

  def set_role
    self.role  ||= 'standard'   
  end        

end
