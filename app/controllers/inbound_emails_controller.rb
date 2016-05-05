class InboundEmailsController < ApplicationController
  include InboundEmailsHelper
  skip_before_filter :verify_authenticity_token, only: [:create]
  before_action :set_inbound_email, only: [:show]

  def index
    @inbound_emails = InboundEmail.all
  end

  def show
  end

  def create
    params[:inbound_email] = structure_inbound_response(request)
    @inbound_email = InboundEmail.new(inbound_email_params)

    respond_to do |format|
      if @inbound_email.save
        format.html { redirect_to @inbound_email, notice: 'Inbound email was successfully created.' }
        format.json { render :show, status: :created, location: @inbound_email }
      else
        format.html { render :new }
        format.json { render json: @inbound_email.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_inbound_email
      @inbound_email = InboundEmail.find(params[:id])
    end

    def inbound_email_params
      params.require(:inbound_email).permit(:sender, :recipient, :subject, :body, :attachments)
    end
end
