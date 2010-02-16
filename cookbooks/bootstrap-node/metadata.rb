maintainer       "Orcloud"
maintainer_email "chef@hugoduncan.org"
license          "Apache 2.0"
description      "Bootstrap a cloud based node"
long_description IO.read(File.join(File.dirname(__FILE__), 'README'))
version          "0.1"


attribute "orc/user",
  :display_name => "User to bootstrap",
  :description => "User to configure for running chef",
  :type => "hash"

attribute "orc/pk",
  :display_name => "Public key",
  :description => "Public key to authorise for user running chef"

attribute "orc/sudoers",
  :display_name => "Sudo users for bootstrap",
  :description => "Users to allow for sudo",
  :type => "array"

