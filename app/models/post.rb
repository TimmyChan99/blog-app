class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def update_posts_counter
    @user = User.find(author_id)
    @user.update(posts_counter: @user.posts.count)
  end
end
