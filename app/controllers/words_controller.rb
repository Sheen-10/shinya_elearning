class WordsController < ApplicationController
  def index
    @answers = current_user.answers
    @answers = @answers.paginate(page: params[:page], per_page: 7)
  end
end
