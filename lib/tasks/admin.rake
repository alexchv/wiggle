namespace :admin do
  desc 'Create System User'
  task :create => :environment do
    if User.admin
      puts '[Admin] - already exists'
    else
      FactoryGirl.create(:admin)
      puts '[Admin] - was created'
    end
  end

  desc 'Destroy System Users'
  task :destroy => :environment do
    User.admin.andand.destroy
    puts '[Admin] - was removed'
  end

  task :create_with_creds, [:email, :password] => :environment do |task, args|
    FactoryGirl.create(:admin, :email => args.email, :password => args.password)
    puts '[Admin] - was created with credentials'
    puts "Email: #{args.email}; Password: #{args.password}"
  end
end