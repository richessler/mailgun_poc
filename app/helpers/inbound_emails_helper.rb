module InboundEmailsHelper

  def structure_inbound_response(request)
    email = request.POST
    {
        sender: email['From'],
        recipient: email['To'],
        subject: email['subject'],
        body: email['body-plain'],
        attachments: email['attachments'] || []
    }
  end
end
