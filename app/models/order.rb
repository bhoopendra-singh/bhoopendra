require "pdfkit"
require "render_anywhere"
class Order < ApplicationRecord
  include RenderAnywhere
  validates :ammount, :status,presence: true
  belongs_to :user
  has_one :invoice
  has_many :cart_items
  has_one :subscription
  #after_create :generate_pdf_of_invoice 
  def create_invoice
    Invoice.create(user_id: user.id, order_id: id)
  end

  def generate_pdf_of_invoice
    kit = PDFKit.new(as_htmls, page_size: 'A4')
    kit.to_file("invoice.pdf")
  end
  def as_htmls
    render template: "carts/pdf_invoice",layout: "invoice_pdf", locals: { order: self}
  end

  def generate_pdf_of_subscription
    kit = PDFKit.new(as_html, page_size: 'A4')
    kit.to_file("subscription.pdf")
  end

  def as_html
    render template: "carts/subscription_pdf",layout: "invoice_pdf", locals: { subscription: self.subscription}
  end

end
