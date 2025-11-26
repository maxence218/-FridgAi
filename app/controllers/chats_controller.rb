class ChatsController < ApplicationController
  def show
    @user = current_user
    @chat = Chat.find(params[:id])
    @message = Message.new
    # @message.chats_id = params[:id]
  end

  def create
    @chat = Chat.create(user: current_user)
    redirect_to @chat
  end
end
