class ChatsController < ApplicationController
  def show
    @user = current_user
    @chat = @user.chats.first
    @message = Message.new
    # @message.chats_id = params[:id]
  end

  def new
  end
end
