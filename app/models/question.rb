class Question < ApplicationRecord
  has_many :hashtag_questions, dependent: :destroy
  has_many :hashtags, through: :hashtag_questions
  belongs_to :user
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true

  validates :text, presence: true, length: { maximum: 255 }

  after_save_commit :create_hashtags

  private

  def create_hashtags
    self.hashtags =
      "#{text} #{answer}".downcase.
        scan(Hashtag::REGEXP).
        uniq.
        map { |ht| Hashtag.find_or_create_by(text: ht.delete('#'))}
  end
end
