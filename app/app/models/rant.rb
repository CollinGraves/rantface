class Rant < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :body, presence: true

  before_create :post_to_twitter

  def post_to_twitter
    # This will make call to RantReverse service
    final_arr = RantReverse.call body

    final_arr.each do |body|
      user.twitter.update body
    end
  end
end
