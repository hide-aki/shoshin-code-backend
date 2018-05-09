# setup exercise table

# codewars_api_root = "https://www.codewars.com/api/v1/code-challenges"
# slugs = ["binary-tree-compare", "binary-tree-traversal", "the-supermarket-queue", "all-unique", "flatten", "remove-duplicates", "valid-parentheses", "multi-level-sorting", "simple-fun-number-116-prime-string", "longest-palindrome", "binary-search-tree-using-arrays", "convert-string-to-camel-case", "where-my-anagrams-at"]

# slugs.each do |slug|
#   # data = JSON.parse( RestClient.get("#{codewars_api_root}/#{slug}", {"Authorization": "H8SByxoz5kPTQ48jT7vw"}) )
#   data = JSON.parse( RestClient.get("#{codewars_api_root}/#{slug}?access_key=H8SByxoz5kPTQ48jT7vw") )

#   # hash would look like this (to store & pass in)
#   # {id: data.id, name: data.name, slug: data.slug, category: data.category, url: data.url, rank: data.rank, description: data.description, totalStars: data.totalStars, voteScore: data.voteScore, tags: data.tags}
#   existing_exercise = Exercise.find_by(e_id: data["id"])
#   if existing_exercise
#     puts 'existing exercise'
#     puts existing_exercise
#     existing_exercise.update( e_id: data["id"], name: data["name"], slug: data["slug"], category: data["category"], url: data["url"], rank: data["rank"], description: data["description"], totalStars: data["totalStars"], voteScore: data["voteScore"], tags: data["tags"] )

#   else
#     exercise = Exercise.new do |e|
#       e.e_id = data["id"]
#       e.name = data["name"]
#       e.slug = data["slug"]
#       e.category = data["category"]
#       e.url = data["url"]
#       e.rank = data["rank"]
#       e.description = data["description"]
#       e.totalStars = data["totalStars"]
#       e.voteScore = data["voteScore"]
#       e.tags = data["tags"]
#     end
#     if exercise.save
#       puts 'new exercise saved'
#     else
#       puts 'exercise did not save'
#     end
#   end
# end