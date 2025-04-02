require 'rails_helper'

RSpec.describe Dinamica, type: :model do
  it "is valid with valid attributes" do
    expect(build(:dinamica)).to be_valid
  end

  it "is invalid without a nome" do
    dinamica = build(:dinamica, nome: nil)
    expect(dinamica).not_to be_valid
  end

  it "is invalid without a descricao" do
    dinamica = build(:dinamica, descricao: nil)
    expect(dinamica).not_to be_valid
  end

  describe "#avaliacao_media" do
    it "returns the average rating of associated reviews" do
      dinamica = create(:dinamica)
      create(:review, dinamica: dinamica, nota: 4)
      create(:review, dinamica: dinamica, nota: 2)

      expect(dinamica.avaliacao_media).to eq(3.0)
    end

    it "returns nil if there are no reviews" do
      dinamica = create(:dinamica)
      expect(dinamica.avaliacao_media).to be_nil
    end
  end
end
