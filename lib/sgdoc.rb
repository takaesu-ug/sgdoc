require 'aws-sdk'
require 'erubis'
require 'delegate'

require 'sgdoc/version'
require 'sgdoc/cli'
require 'sgdoc/client'
require 'sgdoc/client_stub' # TODO: 消す
require 'sgdoc/wrappers/security_group'
require 'sgdoc/wrappers/ip_permission'
require 'sgdoc/wrappers/ip_permission_collection'
