class Tweet < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include Bitly

  before_save :clean_username
  after_create :shorten_url

  validates :username, :message, :presence => true

  protected

  def clean_username
    self.username = username.gsub(/[^(\w)]/, '')
  end

  def shorten_url
    self.shorturl = shorten(tweet_url(self))
    save
  end

end
