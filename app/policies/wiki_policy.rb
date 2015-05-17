class WikiPolicy < ApplicationPolicy
  def index?
    true
  end

   def show?
    (user.present? && ((user.role == 'premium') || (user.role == 'admin'))) || record.private != true
   end

   class Scope
    attr_reader :user, :scope

    def initializer(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user.role == 'admin'
        wikis = scope.all 
      elsif user.role == 'premium'
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if wiki.private != true || wiki.user == user || wiki.users.include?(user)
            wikis << wiki
          end
        end
      else
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          if wiki.private != true || wiki.users.include?(user)
            wikis << wiki
          end
        end
      end
      wikis
    end
  end
end