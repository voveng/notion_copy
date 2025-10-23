json.extract! section, :id, :page_id, :position, :kind, :title, :body, :created_at, :updated_at
json.url section_url(section, format: :json)
json.body section.body.to_s
