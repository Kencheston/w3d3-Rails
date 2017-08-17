class Visit < ApplicationRecord
  validates :submitter_id, :short_url_id, presence: true

  belongs_to :user,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :submitter_id

  belongs_to :shortened_url,
    class_name: 'ShortenedUrl',
    primary_key: :id,
    foreign_key: :short_url_id




  def self.record_visit!(user, shortened_url)
    Visit.create!(submitter_id: user.id, short_url_id: shortened_url.id)
  end



end
