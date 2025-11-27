class MessagesController < ApplicationController
  def create
    @user = current_user
    if message_params
      @message = Message.new(message_params)
    else
      @message = "make me recipe"
    end
    @message.chat = Chat.find(params[:chat_id])
    @message.role = "user"
    if @message.save
      ask_fridgAi(@message.content)
      redirect_to chats_path
    else
      render "chats/show", status: :unprocessable_entity
    end
  end

  def ask_fridgAi(message)
    if @user.ingredients.empty?
      Message.create(role: "assistant", content: "Sorry, but you don't have any ingredients, go back to #{link_to "My fridge", fridges_path }, add somme ingredients", chat: @message.chat)
    elsif @user.ustensils.empty?
      Message.create(role: "assistant", content: "Sorry, but you don't have any ustensils, go back to #{link_to "My fridge", fridges_path }, add somme ustensils", chat: @message.chat)
    else
      @ingredients = @user.ingredients
      @ustensils = @user.ustensils
      fridgAi = RubyLLM.chat
      response = fridgAi.with_instructions(system_prompt(@ingredients, @ustensils)).ask(message)
      Message.create(role: "assistant", content: response.content, chat: @message.chat)
    end
  end

  private

  def system_prompt(ingredients, ustensils)
    unless ingredients.empty? && ustensils.empty?
      message = "You are a imaginative chef who can only answer in english. I am an amateur cook who want to make a recipe with only my fridge ingredients. You don't have to use all the ingredients from the list. I have acces to basic condiments. I can't go to shop to add new ingredients. The avaiable ingredients are  #{@ingredients.map { |ingredient| ingredient.name }.join(", ")} and my ustensils #{@ustensils.map { |ustensil| ustensil.name }.join(", ")}. Provide step-by-step instructions in bullet points, using Markdown."
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
