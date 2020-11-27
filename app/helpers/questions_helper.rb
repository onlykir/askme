module QuestionsHelper
  def author_by_id(author)
    User.find_by(id: author)
  end
end
