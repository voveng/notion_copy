# frozen_string_literal: true

json.extract! page, :id, :workspace_id, :user_id, :title, :frontpage, :ancestry, :created_at, :updated_at
json.url page_url(page, format: :json)
