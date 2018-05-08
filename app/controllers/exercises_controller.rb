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

    # get user sessions
    # sessions = user.editor_sessions
    # get user exercises
    # exercises = sessions.map {|s| Exercise.find_by(id: s.exercise_id)}
    # 
    # exercises.map {|e| e.name}
    # => ["flatten()"]

    # sessions.map { |s|
    #   exercises.map { |e|

    #   }
    # }

  end

end
