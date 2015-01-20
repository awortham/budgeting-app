class EnvelopesController < ApplicationController
  def new
    @envelope = Envelope.new
  end

  def create
    @envelope = Envelope.create(envelope_params)
  end

  private
  def envelope_params
    params.require(:envelope).permit(:name, :amount, :percentage)
  end
end
