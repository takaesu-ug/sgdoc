module Sgdoc
  module Cli
    def self.run(argv)
      # VPC情報
      # vpc_id, cidr, name

      # # security_group情報
      # # group_name, group_id, description, ip_permissions:[ip_ranges単位で分割する], ip_permissions_egress:[]
      # ec2 = Aws::EC2::Client.new
      # security_groups = ec2.describe_security_groups.security_groups
      client = ClientStub.new
      # client = Client.new

      # a = client.security_groups_by_vpc_id
      # ap a
      # binding.pry

      template_path = File.expand_path('../templates/security_groups.md.erb', __FILE__)

      aaa = Erubis::Eruby.new(File.read(template_path)).result(security_groups_by_vpc_id: client.security_groups_by_vpc_id)

      puts aaa

      # Aws.ec2.describe_instances.reservations.first.instances.first.security_groups
    end
  end
end
