require 'open-uri'
class TwitterUser < ActiveRecord::Base
  CACHE_EXPIRE_SECONDS = 15.minutes.to_i
  class << self
    # Pulls the TwitterUser from the database cache, or retrieves it from Twitter, caches it, and returns it
    def retrieve(username)
      user = where(username: username).first
      if user && user.cached_at > (CACHE_EXPIRE_SECONDS).seconds.ago
        user
      else
        pull_and_cache(username)
      end
    end

    def pull_and_cache(username)
      Rails.logger.debug("Retrieving #{username} from Twitter")
      # Try to get a list of "clean" tweets that will be from the user and not have extra junk in them
      tweets = Twitter.user_timeline(username, count: 30, exclude_replies: true, include_rts: false)
      if tweets.any?
        find_or_initialize_by_username(username: username).tap do |cached|
          cached.cached_tweet_id = tweets[0].id
          cached.update_from_twitter
          cached.save
        end
      else
        nil
      end
    end
  end

  def update_from_twitter
    self.cached_tweet = open("https://twitter.com/#{username}/status/#{cached_tweet_id}").read
    self.cached_at = Time.now
  end

  def body
    doc.css("body").inner_html.to_s
  end

  def modified_body
    # Clone it so we can mess with it
    d = doc.clone

    # Replace the username with a text field
    d.css("div.permalink-header span.username").each do |username_span|
      username_span.inner_html = doc.create_element("input").tap do |i|
        i.set_attribute("type", "text")
        i.set_attribute("id", "fakewhale_username")
        i.set_attribute("value", "@#{username}")
      end
    end

    # Replace the tweet with a textarea
    d.css("p.tweet-text").each do |tweet_p|
      tweet_p.inner_html = doc.create_element("textarea").tap do |t|
        t.set_attribute("id", "fakewhale_tweet")
        t.set_attribute("placeholder", "Blah blah, I say such important things")
      end
    end

    d.css("body").to_s
  end

  def styling_tags
    doc.css("link [rel='stylesheet'], style").to_s
  end

  protected

  def doc
    @doc ||= Nokogiri::HTML(cached_tweet)
  end
end
