class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def posts_counter
    # User.each do |user| 
    #   user.update(posts_counter: user.posts.count) if user.id == posts.author_id
    # end
    current_user = User.where(["id = :author_id", { author_id: "#{author_id}"}])
    User.update(posts_counter: current_user.posts.count)
  end
end
