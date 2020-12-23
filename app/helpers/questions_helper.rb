module QuestionsHelper
  def text_with_hashtag_link(text)
    text.gsub(Hashtag::REGEXP) do |ht|
      link_to ht, hashtag_path(ht.delete('#').downcase)
    end.html_safe
  end
end
