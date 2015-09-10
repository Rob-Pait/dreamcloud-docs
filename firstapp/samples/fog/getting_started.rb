# step-1
require 'fog'

auth_username = 'your_auth_username'
auth_password = 'your_auth_password'
project_name = 'your_project_name_or_id'
auth_url = 'https://keystone.dream.io'
region_name = 'RegionOne'

conn = Fog::Compute.new({
    :provider            => 'openstack',
    :openstack_auth_url  => auth_url + '/v2.0/tokens',
    :openstack_username  => auth_username,
    :openstack_tenant    => project_name,
    :openstack_api_key   => auth_password
})

# step-2
images = conn.list_images
print images.body

# step-3
flavors = conn.list_flavors
print flavors.body

# step-4
image_id = '90d5e049-aaed-4abc-aa75-60c2b1ed6516'
image = conn.images.get image_id
print image

# step-5
flavor_id = '100'
flavor = conn.flavors.get flavor_id
print flavor

# step-6
instance_name = 'testing'
testing_instance = conn.servers.create(:name => instance_name, :flavor_ref => flavor.id, :image_ref => image.id)

# step-7
print conn.servers

# step-8
testing_instance.destroy

# step-9
key_pair_name = "demokey"

pub_key_file = "~/.ssh/id_rsa.pub"

puts "Checking for existing SSH keypair"

for pair in conn.key_pairs.all()
    if pair.name == key_pair_name
        key_pair = pair
        puts "Key pair \"" + key_pair.name + "\" exists, skipping
import"
        break
    end
end

if not key_pair
    puts "Uploading keypair from ~/.ssh/id_rsa.pub"
    key_file = File.open(File.expand_path(pub_key_file))
    public_key = key_file.read
    key_pair = conn.key_pairs.create :name => key_pair_name,
:public_key => public_key
end

# step-10
conn.create_security_group 'all-in-one', 'network access for all-in-one application.'
for security_group in conn.security_groups.all
    if security_group.name == 'all-in-one'
        all_in_one_security_group = security_group
        break
    end
end

conn.security_group_rules.create :ip_protocol => 'TCP', :from_port => 22, :to_port => 22, :parent_group_id => all_in_one_security_group.id
conn.security_group_rules.create :ip_protocol => 'TCP', :from_port => 80, :to_port => 80, :parent_group_id => all_in_one_security_group.id

# step-11
userdata = "#!/usr/bin/env bash
curl -L -s https://git.openstack.org/cgit/stackforge/faafo/plain/contrib/install.sh
| bash -s -- \ -i faafo -i messaging -r api -r worker -r demo"

# step-12
puts "Checking for an existing instance"
for server in conn.servers.all
    if server.name == instance_name
        instance = server
        break
    end
end

if not instance
    puts "No test instance found, creating one now"
    instance = conn.servers.create :name => instance_name,
                              :flavor_ref => flavor.id,
                              :image_ref => image.id,
                              :key_name => key_pair.name,
                              :user_data => userdata,
                              :security_groups => all_in_one_security_group
end

until instance.ready?
    for server in conn.servers
        if server.name == instance.name
            instance = server
            break
        end
    end
end

# step-13
puts "Checking for an unused ip_address"
for address in conn.addresses.all()
    if not address.instance_id
        ip_address = address
        puts "Unused IP " + ip_address.ip + " found, it will be used
    instead of creating a new IP"
        break
    end
end

if not ip_address
    puts "No unused IP found, generating one now"
    ip_address = conn.addresses.create()
end

# step-14
if instance.public_ip_addresses.length > 0
    puts "Instance already has a floating IP address"
else
    puts "Assigning IP address to instance"
    instance.associate_address(ip_address.ip)
end

# step-15
puts "Fractals app will be deployed to http://#{ip_address.ip}"
