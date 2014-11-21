module ApplicationHelper
 def form_group_tag(errors)
   if errors.any?
     'form-group has-error'
   else
     'form-group'
   end 
end


 def down_vote_link_classes(post)
    arrow = "glyphicon glyphicon-chevron-down "
    vote = current_user.voted(post)
    arrow += "voted" if vote && vote.down_vote?
    arrow
  end

  def up_vote_link_classes(post)
    arrow = "glyphicon glyphicon-chevron-up "
    vote = current_user.voted(post)
    arrow += "voted" if vote && vote.up_vote?
    arrow
  end


  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end
end

