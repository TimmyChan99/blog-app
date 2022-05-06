require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  subject{ Comment.new(author_id: 2, post_id: 5, text: 'comment') }
    

  it 'is valid with valid attributes' do
    expect(subject).to_not be_valid
  end

  it 'is valid with valid post_id' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with valid author_id' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with valid attributes types' do
    expect(subject.author_id).to be_a(Numeric)
    expect(subject.post_id).to be_a(Numeric)
    expect(subject.text).to be_a(String)
  end
end
