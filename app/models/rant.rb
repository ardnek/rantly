class Rant < ActiveRecord::Base
  belongs_to :user

  validates_length_of :body, :minimum => 144, :allow_blank => :false

end
