# frozen_string_literal: true

module Mysql2
  module Iamauth
    class NullTokenProvider
      def initialize(opts)
        @opts = opts
      end

      def password
        @opts["password"] || @opts[:password] || @opts["pass"] || @opts[:pass]
      end
    end
  end
end
