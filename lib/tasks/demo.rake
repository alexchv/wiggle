namespace :demo do

  desc 'Create Demo Data'
  task :seed => :environment do

    puts '===================================Start Demo==================================='

    # Rake::Task['admin:create'].execute
    # User.current_user = User.admin

    FactoryGirl.create(:user_with_website_and_animations)

    puts '===================================End Demo==================================='

    puts '===================================Start Factories============================'

    factory_girl_entity_counts = {}
    # if Rails.env.production?
    #   factory_girl_entity_counts.merge!({
    #                                      :user_with_reports => 3
    #                                     })
    # end

    factory_girl_entity_counts.each do |key, count|
      FactoryGirl.create_list(key, count)
      puts "#{count} [#{key}] was populated with demo data"
    end

    puts '===================================End Factories=============================='

  end

end