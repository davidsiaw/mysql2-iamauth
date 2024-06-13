# frozen_string_literal: true
require "aws-sdk-rds"

module Mysql2
  module Iamauth
    class IamTokenProvider
      def initialize(opts)
        @opts = opts
      end

      def opt_host
        @opts["host"] || @opts[:host]
      end

      def opt_port
        @opts["port"] || @opts[:port]
      end

      def opt_username
        @opts["username"] || @opts[:username] || @opts["user"] || @opts[:user]
      end

      def endpoint
        @opts.dig(:provider_params, "endpoint") || "#{opt_host}:#{opt_port}"
      end

      def user_name
        @opts.dig(:provider_params, "user_name") || opt_username
      end

      def region
        @opts.dig(:provider_params, "region") || "us-east-1"
      end

      def cred_options
        @opts.dig(:provider_params, "cred_options") || {}
      end

      def cred_provider
        @opts.dig(:provider_params, "cred_provider") || "Aws::SharedCredentials"
      end

      def credentials
        Kernel.const_get(cred_provider).new(cred_options)
      end

      def token_generator
        Aws::RDS::AuthTokenGenerator.new(credentials: credentials)
      end

      def password
        return "<empty>" if ENV["ASSETS_PRECOMPILE"].to_i == 1

        token_generator.auth_token(
          region: region,
          endpoint: endpoint,
          user_name: user_name
        )
      end
    end
  end
end
