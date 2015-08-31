require 'ostruct'

class FakeTimeLine
  def user_timeline(user, *_args)
    fail Twitter::Error::NotFound if user == 'not-exists'
    [FakeTweet.new]
  end
end

class FakeTweet
  def text
    'Fake Tweet =)'
  end
end

# Stub Twitter client
module TwitterChallenge
  def self.client
    FakeTimeLine.new
  end
end
