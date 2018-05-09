class ExercisesController < ApplicationController

  def index
    exercises = Exercise.all
    render json: exercises.sort_by { |ex| ex.voteScore }
  end

  def show
    puts '@@@@@exercises#show@@@@@@'
    puts 'userId:'
    puts params['userId']
    puts '@@@@@exercises#show@@@@@@'
    # you need a name and a slug
    user = User.find_by(id: params[:userId])
    exercises = user.exercises
    if exercises
      render json: { userExercises: exercises }
    else
      exercises = [ {name: 'No Saved Sessions ...', slug: ''} ]
      render json: { userExercises: exercises }
    end
  end

end
