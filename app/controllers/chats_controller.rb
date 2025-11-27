class ChatsController < ApplicationController
  def show
    @user = current_user
    @chat = Chat.find(params[:id])
    @message = Message.new
    first_visit(@chat)
  end

  def create
    @chat = Chat.create(user: current_user)
    redirect_to @chat
  end

 def ask_fridgAi(message)
    if @user.ingredients.empty?
      Message.create(role: "assistant", content: "Sorry, but you don't have any ingredients, go back to My fridge, add somme ingredients", chat: @chat)
    elsif @user.ustensils.empty?
      Message.create(role: "assistant", content: "Sorry, but you don't have any ustensils, go back to My fridge, add somme ustensils", chat: @chat)
    else
      @ingredients = current_user.ingredients
      @ustensils = current_user.ustensils
      fridgAi = RubyLLM.chat
      response = fridgAi.with_instructions(system_prompt(@ingredients, @ustensils)).ask(message)
      Message.create(role: "assistant", content: response.content, chat: @chat)
    end
  end


  private

  def first_visit(chat)
    if chat.messages.empty?
      ask_fridgAi("Hello my name is #{current_user.name}, make me a recipe")
    end
  end

  def system_prompt(ingredients, ustensils)
    unless ingredients.empty? && ustensils.empty?
      message = "You are a imaginative chef who can only answer in english. I want to make a recipe with those ingredients #{@ingredients.map { |ingredient| ingredient.name }.join(", ")} and my ustensils #{@ustensils.map { |ustensil| ustensil.name }.join(", ")}. You don't have to use all the ingredients from the list. I have acces to basic condiments. I can't add new ingredients. Provide me step-by-step instructions in bullet points, using Markdown."
    end
  end
end
