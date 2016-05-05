json.array!(@inbound_emails) do |inbound_email|
  json.extract! inbound_email, :id, :sender, :recipient, :subject, :body, :attachments
  json.url inbound_email_url(inbound_email, format: :json)
end
