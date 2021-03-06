all:
  vars:
    ansible_user: root
    ansible_connection: ssh
    ansible_ssh_private_key_file: ../keys/mykey

  hosts:
    %{ for d in droplets }
    ${d.name}:
      ansible_host: ${d.ipv4_address}
    %{ endfor }
