class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.chat = Chat.find(params[:chat_id])
    @ingredients = current_user.ingredients
    @ustensils = current_user.ustensils
    @message.role = "user"
    if @message.save
      fridgeAi = RubyLLM.chat
      response = fridgeAi.with_instructions(system_prompt(@ingredients, @ustensils)).ask(@message.content)
      Message.create(role: "assistant", content: response.content, chat: @message.chat)
      redirect_to chats_path
    else
      render "chats/show", status: :unprocessable_entity
    end
  end

  def system_prompt(ingredients, ustensils)
    message = "You are a chef, i am an amateur cook who want to make a fast recipe with my fridge ingredients and i don't want to go to shop. create me a recipe with those ingredients : #{@ingredients.map { |ingredient| ingredient.name }.join(", ")} and my #{@ustensils.map { |ustensil| ustensil.name }.join(", ")}. Provide step-by-step instructions in bullet points, using Markdown."
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
