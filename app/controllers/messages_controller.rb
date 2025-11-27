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
      Message.create!(role: "assistant", content: response.content, chat: @message.chat)
      full_text = response.content
      lines   = full_text.lines
      title   = lines.first.to_s.strip
      body    = lines[1..].join.strip
      Recipe.create!(
        title:   title,
        content: body,
        user:    current_user
      )
      redirect_to chats_path
    else
      render "chats/show", status: :unprocessable_entity
    end
  end

  def system_prompt(ingredients, ustensils)
  list_ingredients = ingredients.map { |ingredient| ingredient.name }.join(", ")
  list_ustensils   = ustensils.map   { |u| u.name }.join(", ")

  <<~PROMPT
    You are a chef, i am an amateur cook who want to make a fast recipe with my fridge ingredients and i don't want to go to shop. Create me a recipe with those ingredients: #{list_ingredients} and my #{list_ustensils}. Provide step-by-step instructions in bullet points, using Markdown.

    RESPONSE FORMAT (VERY IMPORTANT):
    - First line: the recipe title only.
    - Then a blank line.
    - Then the recipe steps in Markdown bullet points.
  PROMPT
end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
