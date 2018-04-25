class ExercisesController < ApplicationController

  def index
    exercises = Exercise.all
    render json: exercises.sort_by { |ex| ex.voteScore }
  end

  private

  def exercise_params
    params.require(:exercise).permit(:e_id, :name, :slug, :category, :url, :rank, :description, :totalStars, :voteScore, :tags)
  end

end
