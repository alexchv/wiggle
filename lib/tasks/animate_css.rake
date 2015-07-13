namespace :animate_css do

  desc 'Fetch animations from animate.css'
  task :fetch => :environment do
    file_path = Rails.root.join('vendor','assets', 'javascripts', 'bower_components', 'animate.css', 'animate-config.json').to_path

    file = File.read(file_path)
    hash = JSON.parse(file)

    puts '===================================Start Animations Fetch==================================='

    hash.each do |category_array|
      category_name = category_array.first
      animations = category_array.second

      puts "Category: #{category_name}"
      category = AnimationCategory.create({:code => category_name, :name => category_name.camelize})

      animations.each do |animation|
        type = AnimationType.create({
                              :name => animation.first,
                              :code => animation.first.underscore,
                              :status => animation.second ? 'enabled' : 'disabled',
                              :animation_category => category
                             })
        puts "added type: #{type.name}" if type.persisted?
      end

      puts '-------------------------------------'

    end

    puts '===================================End Animations Fetch=============================='

  end

end