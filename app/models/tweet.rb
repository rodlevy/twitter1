class Tweet < ActiveRecord::Base
  # Remember to create a migration
  belongs_to     :twitter_user


end
