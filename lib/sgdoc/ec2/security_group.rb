module Sgdoc
  module EC2
    class SecurityGroup < SimpleDelegator
      def initialize(aws_security_group)
        super(aws_security_group)
      end

      def inbound_permissions
        IpPermissionCollection.new(ip_permissions)
      end

      def outbound_permissions
        IpPermissionCollection.new(ip_permissions_egress)
      end

      def tags_to_json
        return ' ' if tags.empty?

        tags.each_with_object({}) do |tag, memo|
          memo[tag.key] = tag.value
        end.to_json
      end
    end
  end
end
