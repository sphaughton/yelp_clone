require 'rails_helper'
require 'spec_helper'

RSpec.describe ReviewsController, type: :controller do

  it "can be deleted" do
    review = Review.new
    review.destroy
    expect(review.id).to be nil
  end

end
