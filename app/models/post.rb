class Post < ActiveRecord::Base
  has_many :comments, dependent: :delete_all
  validates :title, :text, presence: true

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
