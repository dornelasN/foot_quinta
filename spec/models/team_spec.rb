require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:team) { create(:team) }
  it 'should not be valid if roster name is invalid' do
    valid_roster_names = %w[Under-7 Under-8 Under-9 Under-10 Adults]
    team.roster_name = ''

    expect(team).not_to be_valid

    valid_roster_names.each { |name|
      team.roster_name = name
      expect(team).to be_valid
    }
  end
end
