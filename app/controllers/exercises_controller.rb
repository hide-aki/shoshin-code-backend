class ExercisesController < ApplicationController

  def index
    exercises = Exercise.all
    render json: exercises.sort_by { |e| e.voteScore }
  end

  def show
    puts '========================================= exercises#show ======================================'
    puts 'userId:'
    puts params['userId']
    puts '========================================= exercises#show ======================================'
    user = User.find_by(id: params[:userId]) 
    exercises = user.exercises
    if exercises
      exercises = exercises.sort { |a,b| a.name.downcase <=> b.name.downcase }
      puts '=========================================exercises sorted======================================'
      puts exercises.map { |e| e.name }
      puts '=========================================exercises sorted======================================'
      render json: { userExercises: exercises }
    else
      exercises = [ {name: 'No Saved Sessions ...', slug: ''} ]
      render json: { userExercises: exercises }
    end
  end

end
