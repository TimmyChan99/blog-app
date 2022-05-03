class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  after_save :update_posts_counter

  def recent_comments
    Comment.where(["post_id = :id", { id: "#{id}"}]).order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    @user = User.find(author_id)
    @user.update(posts_counter: @user.posts.count)
  end
end
