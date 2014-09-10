namespace :my_namespace do
  desc "Inserting into the database"
  task :insert_1 => :environment do
  	admin = User.create!(:email => "admin@pc.com",
                         :password => "admin@pc",
                         :password_confirmation => "admin@pc",
                         :roles => ["admin"])

  end

end
