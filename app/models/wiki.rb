class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  scope :visible_to, -> (user) { user && ((user.role == 'premium') || (user.role == 'admin')) ? all : where((private == false) || (private == nil))  }

  def collaborator_for(user)
    collaborators.where(user: user).first
  end

  def markdown_title(title)
    render_as_markdown @wiki.title
  end

  def markdown_body(body)
    render_as_markdown @wiki.body
  end

  private

  def render_as_markdown(attribute)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end

end

