require 'aws-sdk'
require 'erubis'
require 'delegate'

require 'sgdoc/version'
require 'sgdoc/cli'
require 'sgdoc/client'
require 'sgdoc/client_stub' # TODO: 消す
require 'sgdoc/ec2/security_group'
require 'sgdoc/ec2/ip_permission'
require 'sgdoc/ec2/ip_permission_collection'
