module Sgdoc
  module Wrappers
    class IpPermission < SimpleDelegator
      ALL_STRING = 'all'

      def initialize(ip_permission:, ip_range: nil, user_id_group_pair: nil)
        raise StandardError 'Unknown pattern of IpPermission, at least must need ip_range or user_id_group_pair' if ip_range.nil? && user_id_group_pair.nil?

        @ip_range = ip_range
        @user_id_group_pair = user_id_group_pair
        super(ip_permission)
      end

      # http://docs.aws.amazon.com/sdkforruby/api/Aws/EC2/Types/IpPermission.html#ip_protocol-instance_method
      def protocol
        ip_protocol == '-1' ? ALL_STRING : ip_protocol
      end

      # http://docs.aws.amazon.com/sdkforruby/api/Aws/EC2/Types/IpPermission.html#from_port-instance_method
      # http://docs.aws.amazon.com/sdkforruby/api/Aws/EC2/Types/IpPermission.html#to_port-instance_method
      def port
        if protocol == ALL_STRING
          ALL_STRING
        elsif from_port == -1 && to_port == -1
          'ICMP ALL'
        elsif from_port == -1 || to_port == -1
          'CUSTOM ICMP'
        elsif from_port == to_port
          from_port
        else
          "#{from_port} - #{to_port}"
        end
      end

      def target
        @ip_range ? @ip_range.cidr_ip : @user_id_group_pair.group_id
      end

      def doc_description
        # TODO
        '-'
      end
    end
  end
end
