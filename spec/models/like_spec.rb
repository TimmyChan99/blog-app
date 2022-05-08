require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(author_id: 2, post_id: 5) }

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
end
