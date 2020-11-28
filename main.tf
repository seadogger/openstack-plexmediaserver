resource "openstack_compute_instance_v2" "test_instance" {
  name            = "test_instance"
  image_name      = "ubuntu18.04"
  flavor_name     = "m1.tiny"
  key_pair        = "OpenStack"
  security_groups = ["default"]

  block_device {
    source_type           = "blank"
    destination_type      = "volume"
    volume_size           = 80
    boot_index            = 0
    delete_on_termination = true
  }
  
  network {
      name = "private_network"
    }

  #network {
  #  name = "my_second_network"
  #}
}

#resource "openstack_networking_floatingip_v2" "myip" {
#  pool = "my_pool"
#}

#resource "openstack_compute_floatingip_associate_v2" "myip" {
#  floating_ip = "openstack_networking_floatingip_v2.myip.address"
#  instance_id = "openstack_compute_instance_v2.multi-net.id"
#  fixed_ip    = "openstack_compute_instance_v2.multi-net.network.1.fixed_ip_v4"
#}