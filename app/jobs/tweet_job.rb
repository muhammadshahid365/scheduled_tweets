class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet_id)
    tweet_record = Tweet.find_by_id tweet_id
    return if (!tweet_record || tweet_record.published? || tweet_record.publish_at > Time.current)

    tweet_record.publish_to_twitter!
  end
end
