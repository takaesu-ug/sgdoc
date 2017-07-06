module Sgdoc
  class ClientStub < Client
    def initialize
      @aws_ec2 = nil
    end

    def security_groups_by_vpc_id
      @security_groups ||= Marshal.load(File.read('security_groups.dump')).map { |sg| Sgdoc::EC2::SecurityGroup.new(sg) }
      @security_groups.group_by { |sg| sg.vpc_id }
    end
  end
end
