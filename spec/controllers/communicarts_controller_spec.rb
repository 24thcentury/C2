require 'spec_helper'

describe CommunicartsController do

  let(:params) {

  '{
        "cartNumber": "2867637",
        "category": "initiation",
        "attention": "read.robert@gmail.com",
        "fromAddress": "",
        "gsaUserName": "",
        "initiationComment": "\r\n\r\nHi, this is a comment, I hope it works!\r\nThis is the second line of the comment.",
        "cartItems": [
          {
            "vendor": "DOCUMENT IMAGING DIMENSIONS, INC.",
            "description": "ROUND RING VIEW BINDER WITH INTERIOR POC",
            "url": "/advantage/catalog/product_detail.do?&oid=704213980&baseOid=&bpaNumber=GS-02F-XA002",
            "notes": "",
            "qty": "24",
            "details": "Direct Delivery 3-4 days delivered ARO",
            "partNumber": "7510-01-519-4381",
            "price": "$2.46",
            "features": []
          },
          {
            "vendor": "OFFICE DEPOT",
            "description": "PEN,ROLLER,GELINK,G-2,X-FINE",
            "url": "/advantage/catalog/product_detail.do?&oid=703389586&baseOid=&bpaNumber=GS-02F-XA009",
            "notes": "",
            "qty": "5",
            "details": "Direct Delivery 3-4 days delivered ARO",
            "partNumber": "PIL31003",
            "price": "$10.29",
            "features": []
          },
          {
            "vendor": "METRO OFFICE PRODUCTS",
            "description": "PAPER,LEDGER,11X8.5",
            "url": "/advantage/catalog/product_detail.do?&oid=681115589&baseOid=&bpaNumber=GS-02F-XA004",
            "notes": "",
            "qty": "3",
            "details": "Direct Delivery 3-4 days delivered ARO",
            "partNumber": "WLJ90310",
            "price": "$32.67",
            "features": []
          }
        ]
      }'
    }

  describe 'POST send_cart' do
    it 'creates a cart' do
      json_params = JSON.parse(params)
      CommunicartMailer.stub_chain(:cart_notification_email, :deliver)

      Cart.should_receive(:create_from_cart_items).exactly(3).times
      post 'send_cart', json_params
    end
  end
end
