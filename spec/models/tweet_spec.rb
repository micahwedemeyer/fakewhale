require 'spec_helper'

describe Tweet do
  let(:new_tweet) { FactoryGirl.build(:tweet) }

  before do
    # Don't want to hit bitly in the specs...
    new_tweet.stub(:shorten).and_return("http://bit.ly/short")
  end

  describe "#clean_username" do
    before do
      new_tweet.username = "@someguy"
    end

    it "should remove the @ symbol if there" do
      new_tweet.save
      new_tweet.username.should == "someguy"
    end
  end

  describe "#shorten_url" do
    it "should shorten the URL via bitly" do
      new_tweet.should_receive(:shorten).and_return("http://bit.ly/my-short-url")

      new_tweet.save
      new_tweet.shorturl.should == "http://bit.ly/my-short-url"
    end
  end
end
