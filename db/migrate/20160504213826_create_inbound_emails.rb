class CreateInboundEmails < ActiveRecord::Migration
  def change
    create_table :inbound_emails do |t|
      t.string :sender
      t.string :recipient
      t.string :subject
      t.text :body
      t.string :attachments, array: true, default: []

      t.timestamps null: false
    end
  end
end
