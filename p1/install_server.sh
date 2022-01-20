#! /bin/bash

# installation 


yum install -y container-selinux selinux-policy-base
rpm -i https://rpm.rancher.io/k3s-selinux-0.1.1-rc1.el7.noarch.rpm
curl -sfL https://get.k3s.io | sh -

# flannel

sudo vim /etc/systemd/system/k3s.service
    # ExecStart=/usr/local/bin/k3s \
    #     server \
    #     --flannel-iface 'eth1'

sudo systemctl daemon-reload
sudo systemctl restart k3s




# installation de kubectl

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

yum install -y kubectl


# certificat

/etc/rancher/k3s/k3s.yaml


# modification des droits

chmod 644 /etc/rancher/k3s/k3s.yaml


# premier kubectl 


kubectl get nodes
# -o wide
# --kubeconfig=/etc/rancher/k3s/k3s.yaml
# ou run avec --write-kubeconfig-mode

