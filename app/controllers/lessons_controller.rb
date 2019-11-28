class LessonsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @lesson = @category.lessons.build(user: current_user)

    def show
      @lesson = Lesson.find(params[:id])
      @answers = @lesson.answers.paginate(page: params[:page], per_page: 5)
    end

    if @lesson.save
      redirect_to new_lesson_answer_url(@lesson)
    end
  end

  def show
  end
end
