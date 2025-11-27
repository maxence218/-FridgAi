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
      Message.create(role: "assistant", content: "Sorry, but you don't have any ingredients, go back to #{link_to "My fridge", fridges_path }, add somme ingredients", chat: @chat)
    elsif @user.ustensils.empty?
      Message.create(role: "assistant", content: "Sorry, but you don't have any ustensils, go back to #{link_to "My fridge", fridges_path }, add somme ustensils", chat: @chat)
    else
      @ingredients = @user.ingredients
      @ustensils = @user.ustensils
      fridgeAi = RubyLLM.chat
      response = fridgeAi.with_instructions(system_prompt(@ingredients, @ustensils)).ask(message)
      Message.create!(role: "assistant", content: response.content, chat: @chat)
      full_text = response.content
      lines   = full_text.lines
      title   = lines.first.to_s.strip
      body    = lines[1..].join.strip
      Recipe.create!(
        title:   title,
        content: body,
        user:    current_user
      )
    end
  end


  private

  def first_visit(chat)
    if chat.messages.empty?
      ask_fridgAi("Hello my name is #{current_user.name}, make me a recipe")
    end
  end

  def system_prompt(ingredients, ustensils)
    list_ingredients = ingredients.map { |ingredient| ingredient.name }.join(", ")
    list_ustensils   = ustensils.map   { |u| u.name }.join(", ")

    <<~PROMPT
     "You are a imaginative chef who can only answer in english. I want to make a recipe with those ingredients #{list_ingredients} and my ustensils #{list_ustensils}. You don't have to use all the ingredients from the list. I have acces to basic condiments. I can't add new ingredients. Provide me step-by-step instructions in bullet points, using Markdown."

      RESPONSE FORMAT (VERY IMPORTANT):
      - First line: the recipe title only.
      - Then a blank line.
      - Then the recipe steps in Markdown bullet points.
    PROMPT
  end
end
