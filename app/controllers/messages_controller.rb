class MessagesController < ApplicationController
  SYSTEM_PROMPT = "You are a chef, "
def create
    @message = Message.new(message_params)
    @message.chat = Chat.find(params[:chat_id])
    @message.role = "user"
    if @message.save
      fridgeAi = RubyLLM.chat
      response = fridgeAi.with_instructions(SYSTEM_PROMPT).ask(@message.content)
      message.create(role: "assistant", content: response.content, chat: @message.chat)
      redirect_to chats_path
    else
      render "chats/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
