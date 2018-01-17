class TeamsController < ApplicationController
  def show
    @team = Team.find(params[:id])
    @players = @team.players
    @player = @team.players.build
  end

  def send_text(phone_number)
    player_phone_number = '1' + phone_number
    sms_body = params[:sms_body]
    @twilio_client = Twilio::REST::Client.new

    @twilio_client.messages.create(
      from: '18055002638',
      to: player_phone_number,
      body: sms_body
    )
  end

  def teamtext
    @team = Team.find(params[:team_id])

    @team.players.each do |player|
      send_text(player.phone_number)
    end

    redirect_to @team
    flash[:success] = 'Text Messages Sent'
  end
end
