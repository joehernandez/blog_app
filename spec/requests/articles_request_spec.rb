require 'rails_helper'

RSpec.describe ArticlesController, type: :request do
  describe '#index' do
    it 'returns http success' do
      get '/articles'
      expect(response).to have_http_status(:ok)
    end

    it 'returns valid JSON' do
      article = create :article
      get '/articles'
      body = JSON.parse(response.body).deep_symbolize_keys
      expect(body).to eq(
        data: [
          {
            id: article.id.to_s,
            type: 'article',
            attributes: {
              title: article.title,
              content: article.content,
              slug: article.slug
            }
          }
        ]
      )
    end
  end
end
