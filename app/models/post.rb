class Post < ApplicationRecord

    # validations
  validates_presence_of :title, :body
end
