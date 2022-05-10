class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_commit :update_posts_counter

  def recent_comments
    Comment.where(['post_id = :id', { id: id.to_s }]).order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    @user = User.find(author_id)
    @user.update(posts_counter: @user.posts.count)
  end
end
