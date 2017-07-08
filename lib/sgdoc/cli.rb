module Sgdoc
  module Cli
    def self.run(argv)
      # VPC Information vpc_id, cidr, name

      client = Client.new
      template_path = File.expand_path('../templates/security_groups.md.erb', __FILE__)

      result = Erubis::Eruby.new(File.read(template_path))
        .result(security_groups_by_vpc_id: client.security_groups_by_vpc_id, instances_by_vpc_id: client.instances_by_vpc_id)

      puts result
    end
  end
end
