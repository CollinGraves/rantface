class Rant < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :body, presence: true

  before_create :post_to_twitter

  def post_to_twitter
    # This will make call to RantReverse service
    user.twitter.update(body)
  end
end
