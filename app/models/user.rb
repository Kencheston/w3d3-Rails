class User < ActiveRecord::Base
  validates :email,  presence: true, uniqueness: true

  has_many :submitted_urls,
    class_name: 'ShortenedUrl',
    primary_key: :id,
    foreign_key: :user_id

  has_many :visited_urls,
    class_name: 'Visit',
    primary_key: :id,
    foreign_key: :submitter_id

  # def self.create!(long_url)
  #   ShortenedUrl.random_code
  # end
end
