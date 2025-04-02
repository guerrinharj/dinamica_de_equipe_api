require 'rails_helper'

RSpec.describe Review, type: :model do
  it "is valid with valid attributes" do
    expect(build(:review)).to be_valid
  end

  it "is invalid without a comentario" do
    review = build(:review, comentario: nil)
    expect(review).not_to be_valid
  end

  it "is invalid without a nota" do
    review = build(:review, nota: nil)
    expect(review).not_to be_valid
  end

  it "is invalid with a nota outside 1..5" do
    invalid_review = build(:review, nota: 6)
    expect(invalid_review).not_to be_valid
  end

  it "belongs to a dinamica" do
    review = build(:review)
    expect(review.dinamica).to be_a(Dinamica)
  end
end
