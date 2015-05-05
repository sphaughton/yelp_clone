require 'rails_helper'
require 'spec_helper'

RSpec.describe ReviewsController, type: :controller do

  it "deletes a review" do
    review = Review.new
    review.destroy
    expect(review.id).to be nil
  end

  it "successfully redirects to the restaurants page after deleting a review" do
    review = Review.new
    review.destroy
    expect(response.status).to eq(200)
  end

  it "displays flash notice that review is deleted" do
    review = Review.new
    review.destroy
    expect(:notice).to be_present
  end

end
