json.extract! ticket, :id, :title, :description, :status, :creator_id, :developer_id, :qa_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
