class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.valid?
      flash[:success] = 'Message received, thanks!'
      redirect_to root_path
    else
      flash[:danger] = 'There was an error with your message'
      redirect_to contact_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :body)
  end
end
