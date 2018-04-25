require 'byebug'
Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true


  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # setup exercise table
  # config.after_initialize do
  #   codewars_api_root = "https://www.codewars.com/api/v1/code-challenges"
  #   slugs = ["binary-tree-compare", "binary-tree-traversal", "the-supermarket-queue", "all-unique", "flatten", "remove-duplicates"]

  #   slugs.each do |slug|
  #     # data = JSON.parse( RestClient.get("#{codewars_api_root}/#{slug}", {"Authorization": "H8SByxoz5kPTQ48jT7vw"}) )
  #     data = JSON.parse( RestClient.get("#{codewars_api_root}/#{slug}?access_key=H8SByxoz5kPTQ48jT7vw") )

  #     # hash would look like this (to store & pass in)
  #     # {id: data.id, name: data.name, slug: data.slug, category: data.category, url: data.url, rank: data.rank, description: data.description, totalStars: data.totalStars, voteScore: data.voteScore, tags: data.tags}
  #     existing_exercise = Exercise.find_by(e_id: data["id"])
  #     if existing_exercise
  #       puts 'existing exercise'
  #       puts existing_exercise
  #       existing_exercise.update( e_id: data["id"], name: data["name"], slug: data["slug"], category: data["category"], url: data["url"], rank: data["rank"], description: data["description"], totalStars: data["totalStars"], voteScore: data["voteScore"], tags: data["tags"] )

  #     else
  #       exercise = Exercise.new do |e|
  #         e.e_id = data["id"]
  #         e.name = data["name"]
  #         e.slug = data["slug"]
  #         e.category = data["category"]
  #         e.url = data["url"]
  #         e.rank = data["rank"]
  #         e.description = data["description"]
  #         e.totalStars = data["totalStars"]
  #         e.voteScore = data["voteScore"]
  #         e.tags = data["tags"]
  #       end
  #       if exercise.save
  #         puts 'new exercise saved'
  #       else
  #         puts 'exercise did not save'
  #       end
  #     end
  #   end
  # end


end



