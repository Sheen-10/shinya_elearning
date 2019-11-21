class Admin::WordsController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @words = @category.words
  end

  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
    3.times{@word.choices.build}
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.build(word_params)
    if @word.save
      flash[:success] = "Create New Word"
      redirect_to admin_category_words_url
    else
      render "new"
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @word = @category.words.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update_attributes(word_params)
      flash[:success] = "Word Successfully Updated"
      redirect_to admin_category_words_url
    else
      render 'edit'
    end
  end

  def destroy
    @word = Word.find(params[:id])
    if @word.destroy
      flash[:success] = "Removed Word"
      redirect_to admin_category_words_url
    else
      render 'new'
    end
  end

  private
    def word_params
      params.require(:word).permit(:content, choices_attributes: [:id, :content, :isCorrect])
    end

end