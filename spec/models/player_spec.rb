require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:team) { create(:team) }
  let(:player) { create(:player, team_id: team.id) }

  it 'should be valid when all attributes are set' do
    expect(player).to be_valid
  end

  it 'should not be valid when name is not set' do
    player.name = ''

    expect(player).not_to be_valid
  end

  it 'should not be valid when position is not set' do
    valid_positions = %w{ Goalkeeper Defender Midfielder Forward }
    invalid_positions = %w{ position defensive not-positon asdf }
    player.position = ''

    expect(player).not_to be_valid

    valid_positions.each { |position|
      player.position = position
      expect(player).to be_valid
    }

    invalid_positions.each { |position|
      player.position = position
      expect(player).not_to be_valid
    }
  end

  it 'should not be valid when date of birth is not set' do
    player.date_of_birth = nil

    expect(player).not_to be_valid
  end

  it 'should not be valid when phone number is invalid' do
    player.phone_number = ''

    expect(player).not_to be_valid

    player.phone_number = '123456789'

    expect(player).not_to be_valid

    player.phone_number = '12345678901'

    expect(player).not_to be_valid

    player.phone_number = '1234567890'

    expect(player).to be_valid
  end
end
