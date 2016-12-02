class Authorization < ApplicationRecord
  # Associations
  belongs_to :user

  # Validations
  validates_presence_of :uid, :provider, :token

  # Callbacks
  after_create :fetch_details

  def fetch_details
    self.send("fetch_details_from_#{self.provider.downcase}")
  end

  def fetch_details_from_facebook
    graph = Koala::Facebook::API.new(self.token)
    facebook_data = graph.get_object('me')
    self.username = facebook_data['username']
    self.name = facebook_data['name']
    self.save
  end

  def fetch_details_from_linkedin
  end

end
