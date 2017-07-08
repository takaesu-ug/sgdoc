module Sgdoc
  # TODO: VPCから順に構造体にしていく方法にした方がいい
  class Client
    attr_reader :security_groups

    def initialize(ec2_client: nil, ec2_resource: nil)
      @ec2_client = ec2_client || Aws::EC2::Client.new
      @ec2_resource = ec2_resource || Aws::EC2::Resource.new(client: @ec2_client)
    end

    def security_groups_by_vpc_id
      describe_security_groups = @ec2_client.describe_security_groups.security_groups
      security_groups ||= describe_security_groups.map { |sg| Sgdoc::EC2::SecurityGroup.new(sg) }

      # vpcIDのキーをvpcのオブジェクトにしても良い
      security_groups.group_by { |sg| sg.vpc_id }
    end

    def instances_by_vpc_id
      instances = @ec2_resource.instances.map { |i| Sgdoc::EC2::Instance.new(i) }
      instances.group_by { |i| i.vpc_id }
    end
  end
end
