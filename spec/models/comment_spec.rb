require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, user_id: user.id) }
  it 'should be valid' do
    comment = post.comments.create(body: 'Comment reply')

    expect(comment).to be_valid
  end

  it 'comment body should be present' do
    comment = post.comments.create(body: '')

    expect(comment).not_to be_valid
  end
end
