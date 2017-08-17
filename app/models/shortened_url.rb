class ShortenedUrl < ApplicationRecord

  belongs_to :user,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id

  has_many :visitors,
    class_name: :visit,
    primary_key: :id,
    foreign_key: :short_url_id

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(
    user_id: user.id,
    long_url: long_url,
    short_url: ShortenedUrl.random_code
    )
  end

  def self.random_code
    while true
      random_code = SecureRandom.urlsafe_base64(16)
      return random_code unless ShortenedUrl.exists?(short_url: random_code)
    end
  end

  def num_clicks
    visitors.count
  end

  def num_uniqs
    visitors.select('user_id').distinct.count
  end


end


# rails generate model => create model and migration
