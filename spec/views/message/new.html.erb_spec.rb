require 'rails_helper'

RSpec.describe 'messages/new.html.erb', type: :view do
  it 'should have the contact-me form' do
    render

    expect(rendered).to have_field('Name', type: :text)
    expect(rendered).to have_field('Email', type: :email)
    # TODO: field body is not matching
    expect(rendered).to have_field('Body', type: :text_area)
    expect(rendered).to have_field('Send', type: :submit)
  end
end