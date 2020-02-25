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
  module Payment
    module ProcessingDecorator
      def close!
        gateway_action(source, :close, :close)
      end
    end
  end
end

Spree::Payment::Processing.prepend(Spree::Payment::ProcessingDecorator)
