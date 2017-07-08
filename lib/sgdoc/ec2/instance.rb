module Sgdoc
  module EC2
    class Instance < SimpleDelegator
      def initialize(aws_instance)
        super(aws_instance)
      end

      def name
        tags.detect { |t| t.key == 'Name' }&.value
      end

      def group_names_to_s
        security_groups.map(&:group_name).join(', ')
      end
    end
  end
end
