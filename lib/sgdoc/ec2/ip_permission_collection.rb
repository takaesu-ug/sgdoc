module Sgdoc
  module EC2
    class IpPermissionCollection
      include Enumerable

      def initialize(ip_permissions)
        # ip_ranges, user_id_group_pairs(security_group) がそれぞれ Source, Destination として定義される
        # ip_rages, user_id_group_pairsはそれぞれ配列で複数ある場合がある
        @ip_permissions = ip_permissions.each_with_object([]) do |ip_permission, memo|
          ip_permission.ip_ranges.each do |ip_range|
            memo << IpPermission.new(ip_permission: ip_permission, ip_range: ip_range)
          end

          ip_permission.user_id_group_pairs.each do |user_id_group_pair|
            memo << IpPermission.new(ip_permission: ip_permission, user_id_group_pair: user_id_group_pair)
          end
        end
      end

      def each
        @ip_permissions.each do |ip_permission|
          yield ip_permission
        end
      end
    end
  end
end
