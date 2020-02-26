# frozen_string_literal: true

##
# Amazon Payments - Login and Pay for Spree Commerce
#
# @category    Amazon
# @package     Amazon_Payments
# @copyright   Copyright (c) 2014 Amazon.com
# @license     http://opensource.org/licenses/Apache-2.0  Apache License, Version 2.0
#
##
module SpreeAmazonPayments
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_amazon_payments'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'spree.gateway.payment_methods', after: 'spree.register.payment_methods' do |app|
      app.config.spree.payment_methods << Spree::Gateway::Amazon
    end

    initializer 'spere_amazon_payments.configuration' do
      Spree::AppConfiguration.class_eval do
        preference :amazon_checkout_display_mode, :string, default: 'modified_checkout'
        preference :amazon_client_id, :string
        preference :amazon_merchant_id, :string
        preference :amazon_aws_access_key_id, :string
        preference :amazon_aws_secret_access_key, :string
      end
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
