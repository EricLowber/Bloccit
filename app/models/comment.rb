class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :body, length: {minimum: 5}, presence: true
  validates :user, presence: true

  def markdown_body
    render_as_markdown body
  end
end


private

def render_as_markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
end