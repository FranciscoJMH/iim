json.extract! article, :id, :name, :unit, :price, :provider_id, :project_id, :created_at, :updated_at
json.url article_url(article, format: :json)
