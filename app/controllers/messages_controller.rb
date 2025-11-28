class MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @user = current_user
    if message_params
      @message = Message.new(message_params)
    else
      @message = "make me a recipe"
    end
    @message.chat = Chat.find(params[:chat_id])
    @message.role = "user"

    if @message.save
      ask_fridgAi(@message.content)
       respond_to do |format|
        format.turbo_stream # renders `app/views/messages/create.turbo_stream.erb`
        format.html { redirect_to chat_path(@chat) }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_message", partial: "messages/form", locals: { chat: @chat, message: @message }) }
        format.html { render "chats/show", status: :unprocessable_entity }
      end
    end
  end

  def ask_fridgAi(message)
    if @user.ingredients.empty?
      Message.create(role: "assistant", content: "Sorry, but you don't have any ingredients, go back to My fridge, add somme ingredients", chat: @message.chat)
    elsif @user.ustensils.empty?
      Message.create(role: "assistant", content: "Sorry, but you don't have any ustensils, go back to My fridge, add somme ustensils", chat: @message.chat)
    else
      @ingredients = @user.ingredients
      @ustensils = @user.ustensils
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
    end
  end

  private

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

  def message_params
    params.require(:message).permit(:content)
  end
end
