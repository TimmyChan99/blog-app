require 'rails_helper'

RSpec.describe User, type: :model do

  subject { 
    User.new(name: "Tom",
            photo: "photo_url",
            bio: "English teacher",
            posts_counter: 3,
          id:1,)
  }
  
  it "is valid with valid attributes" do
    expect(User.new).to_not be_valid
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is valid with valid name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is valid with valid posts_counter" do
    subject.posts_counter = 5.5
    expect(subject).to_not be_valid
  end

  it "is valid with valid posts_counter" do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
    subject.posts_counter = 0
    expect(subject).to be_valid
  end

  it "#recent_tree_posts return list posts" do
    last_posts = subject.recent_tree_posts
    expect(last_posts.length).to be < 3
  end

end
