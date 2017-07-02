module Sgdoc
  class Client
    attr_reader :security_groups

    def initialize(ec2: nil)
      @aws_ec2 = ec2 || Aws::EC2::Client.new
    end

    def security_groups_by_vpc_id
      @security_groups ||= @aws_ec2.describe_security_groups.security_groups.map { |sg| Sgdoc::Wrappers::SecurityGroup.new(sg) }

      # vpcIDのキーをvpcのオブジェクトにしても良い
      @security_groups.group_by { |sg| sg.vpc_id }
    end
  end
end
