class ExercisesController < ApplicationController

  def index
    exercises = Exercise.all
    render json: exercises.sort_by { |e| e.voteScore }
  end

  def show
    user = User.find_by(id: params[:userId]) 
    exercises = user.exercises
    if exercises
      exercises = exercises.sort { |a,b| a.name.downcase <=> b.name.downcase }
      render json: { userExercises: exercises }
    else
      exercises = [ {name: 'No Saved Sessions ...', slug: ''} ]
      render json: { userExercises: exercises }
    end
  end

end
