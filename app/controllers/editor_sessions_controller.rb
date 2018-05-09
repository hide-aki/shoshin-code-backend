class EditorSessionsController < ApplicationController

  def lookup
    user = User.find_by(id: params[:userId])
    session = user.editor_sessions.find_by(exercise_id: params[:exerciseId])
    if session
      # session.editor_content = "flatten(1, [2, 3], 4, 5, [6, [7]]) // returns [1, 2, 3, 4, 5, 6, 7]\nflatten('a', ['b', 2], 3, null, [[4], ['c']]) // returns ['a', 'b', 2, 3, null, 4, 'c']\n"
      content = session.editor_content

      puts '***************lookup content payload*************'
      puts content
      puts '***************lookup content payload*************'

      render json: { editorContent: content } # render back 'no content' if error
    else
      puts '***************ERROR lookup content payload*************'
      puts content
      puts '***************ERROR lookup content payload'
      render json: { editorContent: "\/\/ Welcome! I hope you have as much fun practicing your coding skills with\r\n\/\/ this tool as I\'m having building it! If you\'re using it to practice,\r\n\/\/ you already know that coding is an iterative process. In that spirit,\r\n\/\/ this editor-interpreter is Alpha, and is ES5 only. This means you won\'t\r\n\/\/ be able to use [const] or [let] while coding here. You\'ll have to stick\r\n\/\/ with [var] - for now ... ES6 will be in the next version!\r\n\r\n\/\/ CMD-ENTER TO EVALUATE YOUR CODE\r\n\/\/ console logging expressions or primitives other than strings is not yet\r\n\/\/ implemented. :( It will be!\r\n\r\nconsole.log(\'Hello World!\')\r\n\/\/ type CMD-ENTER"}
    end
  end

  def update
    puts '#####update payload######'
    puts "userId: #{params['userId']}"
    puts "exerciseId: #{params['exerciseId']}"
    puts "sessionContent: #{params['sessionContent']}"
    puts '#####update payload######'
    user = User.find_by(id: params[:userId])
    exercise = Exercise.find_by(id: params[:exerciseId])
    if !user.exercises.include?(exercise)
      user.exercises << exercise
    end
    session = user.editor_sessions.find_by(exercise_id: exercise['id'])
    session.update(editor_content: params['sessionContent'])
    content = session.editor_content

    puts '***************update content payload*************'
    puts content
    puts '***************update content payload*************'

    render json: { editorContent: content }

  end

  def delete
    user = User.find_by(id: params[:userId])
    exercise = Exercise.find_by(id: params[:exerciseId])
    session = user.editor_sessions.find_by(exercise_id: exercise['id'])
    session.delete

    puts '***************DELETE content payload*************'
    puts user.editor_sessions
    puts '***************DELETE content payload*************'

    render json: user.editor_sessions
  end


end
