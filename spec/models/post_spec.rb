require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, user_id: user.id) }

  it 'should be valid' do
    expect(post).to be_valid
  end

  it 'user id should be present' do
    post.user_id = nil

    expect(post).not_to be_valid
  end

  it 'title should be present' do
    post.title = nil

    expect(post).not_to be_valid
  end

  it 'content should be present' do
    post.content = nil

    expect(post).not_to be_valid
  end
end
