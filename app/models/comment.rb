class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :body, length: {minimum: 5}, presence: true
  validates :user, presence: true

  def markdown_body
    render_as_markdown body
  end

  after_create :send_favorite_emails
 
  private
 
  def send_favorite_emails
    post.favorites.each do |favorite|
       if should_receive_update_for?(favorite)
       FavoriteMailer.new_comment(favorite.user, self.post, self).deliver
       end
    end
  end
end


  def should_receive_update_for?(favorite)
      user_id != favorite.user_id && favorite.user.email_favorites?
  end


private

def render_as_markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
end

