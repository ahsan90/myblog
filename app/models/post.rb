class Post < ActiveRecord::Base
  has_many :comments

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
