require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(title: 'Post',
             text: 'Post',
             comments_counter: 'English teacher',
             likes_counter: 3,
             id: 1,
             author_id: 1)
  end

  it 'is valid with valid attributes' do
    expect(Post.new).to_not be_valid
  end

  it 'is valid with valid attributes' do
    expect(subject).to_not be_valid
  end

  it 'is valid with valid title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with valid title length' do
    subject.title = 'This is my first Posts'
    expect(subject.title.length).to be < 250
    subject.title = '||||||||||||||||||||||||||||||||||||||||||||||||||||||
    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'
    expect(subject).to_not be_valid
  end

  it 'is valid with valid comments_counter' do
    expect(subject.comments_counter).to be_a(Integer)
    expect(subject.comments_counter).to be >= 0
    subject.comments_counter = 3.3
    expect(subject).to_not be_valid
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end
  it 'is valid with valid likes_counter' do
    expect(subject.likes_counter).to be_a(Integer)
    expect(subject.likes_counter).to be >= 0
    subject.likes_counter = 3.3
    expect(subject).to_not be_valid
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'recent_comments retuns less or equa to 5 comment' do
    expect(subject.recent_comments.length).to be < 6
  end
end
