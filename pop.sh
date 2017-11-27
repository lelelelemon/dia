#RAILS_ENV=production bin/rake db:create db:schema:load
rails r populate/populateUser.rb $1
rails r populate/populatePost.rb $2
rails r populate/populateTag.rb $3
rails r populate/populateAspect.rb $4