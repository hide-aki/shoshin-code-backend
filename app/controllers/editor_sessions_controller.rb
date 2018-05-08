class EditorSessionsController < ApplicationController

  def lookup
    user = User.find_by(id: params[:userId])
    session = user.editor_sessions.find_by(exercise_id: params[:exerciseId])
    if session
      # session.editor_content = 'NEW LOOKUP CONTENT :)'
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
    # session.editor_content = params[:sessionContent]
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

# 2.3.3 :045 > chuk.editor_sessions.find_by(exercise_id: 1)
#   EditorSession Load (0.5ms)  SELECT  "editor_sessions".* FROM "editor_sessions" WHERE "editor_sessions"."user_id" = $1 AND "editor_sessions"."exercise_id" = $2 LIMIT $3  [["user_id", 3], ["exercise_id", 1], ["LIMIT", 1]]
#  => nil
# 2.3.3 :046 > fifth_exercise = Exercise.all.find_by(id: 5)
#   Exercise Load (0.6ms)  SELECT  "exercises".* FROM "exercises" WHERE "exercises"."id" = $1 LIMIT $2  [["id", 5], ["LIMIT", 1]]
#  => #<Exercise id: 5, e_id: "513fa1d75e4297ba38000003", name: "flatten()", slug: "flatten", category: "algorithms", url: "https://www.codewars.com/kata/flatten", rank: {"id"=>-5, "name"=>"5 kyu", "color"=>"yellow"}, description: "For this exercise you will create a global flatten...", totalStars: 43, voteScore: 88, tags: ["Algorithms", "Arrays", "Data Types"], created_at: "2018-04-25 00:30:24", updated_at: "2018-04-29 20:17:43">
# 2.3.3 :047 > chuk.exercises << fifth_exercise
#    (0.5ms)  BEGIN
#   EditorSession Create (18.7ms)  INSERT INTO "editor_sessions" ("user_id", "exercise_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["user_id", 3], ["exercise_id", 5], ["created_at", "2018-05-07 00:11:25.490482"], ["updated_at", "2018-05-07 00:11:25.490482"]]
#    (2.6ms)  COMMIT
#   Exercise Load (3.6ms)  SELECT  "exercises".* FROM "exercises" INNER JOIN "editor_sessions" ON "exercises"."id" = "editor_sessions"."exercise_id" WHERE "editor_sessions"."user_id" = $1 LIMIT $2  [["user_id", 3], ["LIMIT", 11]]
#  => #<ActiveRecord::Associations::CollectionProxy [#<Exercise id: 5, e_id: "513fa1d75e4297ba38000003", name: "flatten()", slug: "flatten", category: "algorithms", url: "https://www.codewars.com/kata/flatten", rank: {"id"=>-5, "name"=>"5 kyu", "color"=>"yellow"}, description: "For this exercise you will create a global flatten...", totalStars: 43, voteScore: 88, tags: ["Algorithms", "Arrays", "Data Types"], created_at: "2018-04-25 00:30:24", updated_at: "2018-04-29 20:17:43">]>
# 2.3.3 :048 > chuk.editor_sessions
#   EditorSession Load (0.9ms)  SELECT  "editor_sessions".* FROM "editor_sessions" WHERE "editor_sessions"."user_id" = $1 LIMIT $2  [["user_id", 3], ["LIMIT", 11]]
#  => #<ActiveRecord::Associations::CollectionProxy [#<EditorSession id: 2, user_id: 3, exercise_id: 5, editor_content: nil, created_at: "2018-05-07 00:11:25", updated_at: "2018-05-07 00:11:25">]>
# 2.3.3 :049 >
# 2.3.3 :051 > chuks_first_session = chuk.editor_sessions.find_by(exercise_id: 5)
#   EditorSession Load (1.9ms)  SELECT  "editor_sessions".* FROM "editor_sessions" WHERE "editor_sessions"."user_id" = $1 AND "editor_sessions"."exercise_id" = $2 LIMIT $3  [["user_id", 3], ["exercise_id", 5], ["LIMIT", 1]]
#  => #<EditorSession id: 2, user_id: 3, exercise_id: 5, editor_content: nil, created_at: "2018-05-07 00:11:25", updated_at: "2018-05-07 00:11:25">
# 2.3.3 :063 > chuks_first_session.editor_content
#  => nil
# 2.3.3 :064 > chuks_first_session.editor_content = 'chuks new editor content'
#  => "chuks new editor content"
# 2.3.3 :065 >






# franks_first_session = frank.editor_sessions.find_by(exercise_id: 1)
#   EditorSession Load (26.5ms)  SELECT  "editor_sessions".* FROM "editor_sessions" WHERE "editor_sessions"."user_id" = $1 AND "editor_sessions"."exercise_id" = $2 LIMIT $3  [["user_id", 2], ["exercise_id", 1], ["LIMIT", 1]]
#  => #<EditorSession id: 1, user_id: 2, exercise_id: 1, editor_content: nil, created_at: "2018-05-05 23:54:49", updated_at: "2018-05-05 23:54:49">
# 2.3.3 :021 > franks_first_session
#  => #<EditorSession id: 1, user_id: 2, exercise_id: 1, editor_content: nil, created_at: "2018-05-05 23:54:49", updated_at: "2018-05-05 23:54:49">
# 2.3.3 :022 > franks_first_session.editor_content = 'franks first content'
#  => "franks first content"
# 2.3.3 :023 > franks_first_session.editor_content
#  => "franks first content"
# 2.3.3 :024 > franks_first_session
#  => #<EditorSession id: 1, user_id: 2, exercise_id: 1, editor_content: "franks first content", created_at: "2018-05-05 23:54:49", updated_at: "2018-05-05 23:54:49">




# 2.3.3 :025 > check_frank = User.find_by(id: 2)
#   User Load (39.1ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 2], ["LIMIT", 1]]
#  => #<User id: 2, username: "frank", created_at: "2018-05-03 18:46:15", updated_at: "2018-05-03 18:46:15", password_digest: "$2a$10$DXvK8MC3K/XZA0mxtyeXXOrLwtqFcpnjOBRv1daDi4s...">
# 2.3.3 :026 > check_franks_session = check_frank.editor_sessions.find_by(exercise_id: 1)
#   EditorSession Load (28.3ms)  SELECT  "editor_sessions".* FROM "editor_sessions" WHERE "editor_sessions"."user_id" = $1 AND "editor_sessions"."exercise_id" = $2 LIMIT $3  [["user_id", 2], ["exercise_id", 1], ["LIMIT", 1]]
#  => #<EditorSession id: 1, user_id: 2, exercise_id: 1, editor_content: nil, created_at: "2018-05-05 23:54:49", updated_at: "2018-05-05 23:54:49">

# :54:49">
# 2.3.3 :027 > c
# 2.3.3 :027 > check_franks_session.editor_content
#  => nil
# 2.3.3 :028 > check_franks_session.editor_content = "Here is franks first editor content blah blah"
#  => "Here is franks first editor content blah blah"
# 2.3.3 :029 > check_franks_session.editor_content
#  => "Here is franks first editor content blah blah"
# 2.3.3 :030 >

# but on frontend:
# ***********session object: Object
# created_at: "2018-05-05T23:54:49.078Z"
# editor_content: null  <-------
# exercise_id: 1
# id: 1
# updated_at: "2018-05-05T23:54:49.078Z"
# user_id: 2