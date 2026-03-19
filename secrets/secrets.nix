let
  # ~/.ssh/id_ed25519_n1xmk.pub
  user1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIpkqVj7j7cpV0jK5aUTtqdDzcnmTXTRYpbB3nEgqm05 razh3crk1um@protonmail.com";

  # /etc/ssh/ssh_host_ed25519_key.pub
  host1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK5WxCTPKNPRXW0F2R8OC1yum8mqCfjqu4+0Z5M49aQb root@m1uq0m5-n1xmk";

  systems = [user1 host1];
in {
  "user-razh-password.age".publicKeys = systems;
  "root-password.age".publicKeys = systems;
}
