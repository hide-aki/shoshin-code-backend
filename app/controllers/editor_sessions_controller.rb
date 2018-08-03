class EditorSessionsController < ApplicationController
  def show
    user = User.find_by(id: params[:userId])
    session = user.editor_sessions.find_by(exercise_id: params[:exerciseId])
    if session
      content = session.editor_content
      render json: { editorContent: content }
    else
      render json: { editorContent: "\/\/ Welcome. The Shoshin Repl currently implements a complete ECMAScript 3 environment and a partial ECMAScript 6 environment using vm.js, a JS bytecode compiler. Most patterns you would use to solve problems here are supported (including object destructuring and generators!) The next version (in development) will implement a Node.js API instance bootstrapped in the browser. Thank you for using Shoshin!\r\n\/\/ (Remember you can share a live view of your session using the left menu)\r\n\r\n\/\/ type CMD-ENTER TO EVALUATE YOUR CODE :)\r\nconsole.log(\'Hello World!\')"}
    end
  end

  def update
    user = User.find_by(id: params[:userId])

    exercise = Exercise.find_by(id: params[:exerciseId])
    if !user.exercises.include?(exercise)
      user.exercises << exercise
    end
    


    puts "********** session.editor_content **********"
    puts content
    puts "********** session.editor_content **********"

    render json: { editorContent: content }
  end

  def delete
    user = User.find_by(id: params[:userId])
    exercise = Exercise.find_by(id: params[:exerciseId])
    session = user.editor_sessions.find_by(exercise_id: exercise['id'])
    session.delete

    render json: user.editor_sessions
  end

end
