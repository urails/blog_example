class BlogPost < ActiveRecord::Base
  validates :title, :content, presence: true
end
