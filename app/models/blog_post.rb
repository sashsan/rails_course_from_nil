class BlogPost < ApplicationRecord
  has_many :comments, as: :commentable
end
