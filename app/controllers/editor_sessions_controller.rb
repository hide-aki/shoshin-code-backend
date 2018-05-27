class EditorSessionsController < ApplicationController

  def lookup
    user = User.find_by(id: params[:userId])
    session = user.editor_sessions.find_by(exercise_id: params[:exerciseId])
    if session
      content = session.editor_content
      render json: { editorContent: content } # render back 'no content' if error
    else
      render json: { editorContent: "\/\/ Welcome. If you\'re using Shoshin to practice,\r\n\/\/ you probably realize that writing code is an iterative process. In that spirit,\r\n\/\/ this editor/interpreter is Alpha, and is ES5 only. This means you won\'t\r\n\/\/ be able to use [const] or [let], only [var]. Interpreting ES6 will be the next step for Shoshin.\r\n\r\n\/\/ CMD-ENTER TO EVALUATE YOUR CODE\r\n\/\/ console logging expressions or primitives other than strings is not yet\r\n\/\/ implemented. Thank you for trying Shoshin!\r\n\r\nconsole.log(\'Hello World!\')\r\n\/\/ type CMD-ENTER"}
    end
  end

  def update
    user = User.find_by(id: params[:userId])
    exercise = Exercise.find_by(id: params[:exerciseId])
    if !user.exercises.include?(exercise)
      user.exercises << exercise
    end
    session = user.editor_sessions.find_by(exercise_id: exercise['id'])
    session.update(editor_content: params['sessionContent'])
    content = session.editor_content

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
 