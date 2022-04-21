require 'rails_helper'

# FactoryBot basics
  ## build(:article) => returns a Article instance that is NOT saved
  ## create(:article) => returns a Article instance that IS saved

RSpec.describe Article, type: :model do
  describe "#validations" do
    let(:article) { build(:article) }

    it "ensures Article is valid" do
      expect(article).to be_valid
    end
  
    it "reject an invalid title" do
      article.title = ""
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it "fail when non-unique slug is used" do
      non_unique_slug = "my-slug"
      article1 = create(:article, slug: non_unique_slug)
      article2 = build(:article, slug: non_unique_slug)
      expect(article1).to be_valid
      expect(article2).not_to be_valid
    end
  end
end
