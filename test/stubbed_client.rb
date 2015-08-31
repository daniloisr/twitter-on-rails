require 'ostruct'

class FakeTimeLine
  def user_timeline(_user, *_args)
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
