require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) { create(:game) }
  it 'should be valid' do
    expect(game).to be_valid
  end

  context 'it should not be valid' do
    it 'if adversary team is missing' do
      game.adversary_team = nil

      expect(game).not_to be_valid
    end

    it 'if cuervos goals are not valid or lower than 0' do
      game.cuervos_goals = nil

      expect(game).not_to be_valid

      game.cuervos_goals = -1

      expect(game).not_to be_valid
    end

    it 'if adversary goals are not valid or lower than 0' do
      game.adversary_goals = nil

      expect(game).not_to be_valid

      game.adversary_goals = -2

      expect(game).not_to be_valid
    end
  end
end
