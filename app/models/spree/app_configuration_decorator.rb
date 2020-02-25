##
# Amazon Payments - Login and Pay for Spree Commerce
#
# @category    Amazon
# @package     Amazon_Payments
# @copyright   Copyright (c) 2014 Amazon.com
# @license     http://opensource.org/licenses/Apache-2.0  Apache License, Version 2.0
#
##
module Spree
  module AppConfigurationDecorator
    def self.prepended(base)
      base.preference :amazon_checkout_display_mode, :string, default: 'modified_checkout'
      base.preference :amazon_client_id, :string
      base.preference :amazon_merchant_id, :string
      base.preference :amazon_aws_access_key_id, :string
      base.preference :amazon_aws_secret_access_key, :string
    end
  end
end

Spree::AppConfiguration.prepend(Spree::AppConfigurationDecorator)
