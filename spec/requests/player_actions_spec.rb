require 'rails_helper'
require './spec/support/helpers'

describe 'Player actions' do
  include Helpers
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:team) { create(:team) }

  context 'regular users' do
    it 'should not be able to create players' do
      log_in_as user.email, user.password
      player_count_before_create = Player.count

      create_player(team, 'regular_user')

      expect(player_count_before_create).to eq(Player.count)
      expect(response).to redirect_to(root_path)
    end

    it 'should not be able to delete players' do
      player = create_player(team, 'valid_attributes')
      player_count_before_delete = Player.count
      log_in_as user.email, user.password

      delete_player(player)

      expect(player_count_before_delete).to eq(Player.count)
      expect(response).to redirect_to(root_path)
    end
  end

  context 'admin users' do
    it 'should be able to create players if attributes are valid' do
      log_in_as admin.email, admin.password
      player_count_before_create = Player.count

      create_player(team, 'invalid_attributes')

      expect(player_count_before_create).to eq(Player.count)

      create_player(team, 'valid_attributes')

      expect(player_count_before_create).to be < Player.count
    end

    it 'should be able to delete players' do
      log_in_as admin.email, admin.password
      player = create_player(team, 'valid_attributes')
      player_count_before_delete = Player.count

      delete_player(player)

      expect(player_count_before_delete).to be > Player.count
      expect(response).to redirect_to(team)
    end
  end
end
