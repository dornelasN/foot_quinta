require 'rails_helper'

RSpec.describe 'messages/new.html.erb', type: :view do
  it 'should have the contact-me form' do
    assign(:message, Message.new)

    render

    expect(rendered).to have_field(type: :text)
    expect(rendered).to have_field(type: :email)
    expect(rendered).to have_field(type: :textarea)
    expect(rendered).to have_button(value: 'Send')
  end
end