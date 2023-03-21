# Building a Kubernetes 1.24 Cluster with kubeadm

# Introduction
# This lab will allow you to practice the process of building a new Kubernetes cluster.
# You will be given a set of Linux servers, and you will have the opportunity to turn these servers into a functioning Kubernetes cluster.
# This will help you build the skills necessary to create your own Kubernetes clusters in the real world.

# Solution

# Log in to the lab servers using the credentials provided:
# ssh cloud_user@<PUBLIC_IP_ADDRESS>

# Install Packages

# Log in to the control plane node.
# Note: The following steps must be performed on all three nodes.

# Create configuration file for containerd:
- |
  cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
  overlay
  br_netfilter
  EOF

# Load modules:
- sudo modprobe overlay
- sudo modprobe br_netfilter

# Set system configurations for Kubernetes networking:
- |
  cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
  net.bridge.bridge-nf-call-iptables = 1
  net.ipv4.ip_forward = 1
  net.bridge.bridge-nf-call-ip6tables = 1
  EOF

# Apply new settings:
- sudo sysctl --system

# Install containerd:
- sudo apt-get update && sudo apt-get install -y containerd.io

# Create default configuration file for containerd:
- sudo mkdir -p /etc/containerd

# Generate default containerd configuration and save to the newly created default file:
- sudo containerd config default | sudo tee /etc/containerd/config.toml

# Restart containerd to ensure new configuration file usage:
- sudo systemctl restart containerd

# Verify that containerd is running:
- sudo systemctl status containerd

# Disable swap:
- sudo swapoff -a

# Install dependency packages:
- sudo apt-get update && sudo apt-get install -y apt-transport-https curl

# Download and add GPG key:
- curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Add Kubernetes to repository list:
- |
  cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
  deb https://apt.kubernetes.io/ kubernetes-xenial main
  EOF

# Update package listings:
- sudo apt-get update

# Install Kubernetes packages (Note: If you get a dpkg lock message, just wait a minute or two before trying the command again):
- sudo apt-get install -y kubelet=1.24.0-00 kubeadm=1.24.0-00 kubectl=1.24.0-00

# Turn off automatic updates:
- sudo apt-mark hold kubelet kubeadm kubectl

# Log in to both worker nodes to perform previous steps.

# Initialize the Cluster

# On the control plane node, initialize the Kubernetes cluster on the control plane node using kubeadm:
- sudo kubeadm init --pod-network-cidr 192.168.0.0/16 --kubernetes-version 1.24.0

# Set kubectl access:
- mkdir -p $HOME/.kube
- sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
- sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Test access to cluster:
- kubectl get nodes

# Install the Calico Network Add-On

# On the control plane node, install Calico Networking:
- kubectl apply -f https

---

Task: Build a Kubernetes Cluster
Objectives:
- Install and use kubeadm to build a Kubernetes cluster on three servers.
- Install Kubernetes version 1.24.0.
- Use containerd as the container runtime.
- Set up one control plane node and two worker nodes.
- Use the Calico networking add-on for cluster networking.

Instructions:
1. SSH into each server using provided credentials:
   ssh cloud_user@<PUBLIC_IP_ADDRESS>

2. On all servers, create a configuration file for containerd:
   sudo tee /etc/modules-load.d/containerd.conf <<EOF
   overlay
   br_netfilter
   EOF

3. Load kernel modules:
   sudo modprobe overlay
   sudo modprobe br_netfilter

4. Configure system settings for Kubernetes networking:
   sudo tee /etc/sysctl.d/99-kubernetes-cri.conf <<EOF
   net.bridge.bridge-nf-call-iptables = 1
   net.ipv4.ip_forward = 1
   net.bridge.bridge-nf-call-ip6tables = 1
   EOF

5. Apply new system settings:
   sudo sysctl --system

6. Install containerd:
   sudo apt-get update && sudo apt-get install -y containerd.io

7. Create a default configuration file for containerd:
   sudo mkdir -p /etc/containerd
   sudo containerd config default | sudo tee /etc/containerd/config.toml

8. Restart containerd to apply the new configuration file:
   sudo systemctl restart containerd

9. Verify that containerd is running:
   sudo systemctl status containerd

10. Disable swap:
    sudo swapoff -a

11. Install dependencies:
    sudo apt-get update && sudo apt-get install -y apt-transport-https curl

12. Download and add the GPG key:
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

13. Add Kubernetes to the repository list:
    sudo tee /etc/apt/sources.list.d/kubernetes.list <<EOF
    deb https://apt.kubernetes.io/ kubernetes-xenial main
    EOF

14. Update package listings:
    sudo apt-get update

15. Install Kubernetes packages:
    sudo apt-get install -y kubelet=1.24.0-00 kubeadm=1.24.0-00 kubectl=1.24.0-00

16. Prevent automatic updates of Kubernetes packages:
    sudo apt-mark hold kubelet kubeadm kubectl

17. On the control plane node, initialize the Kubernetes cluster:
    sudo kubeadm init --pod-network-cidr 192.168.0.0/16 --kubernetes-version 1.24.0

18. Set up kubectl access:
    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config

19. Verify access to the cluster:
    kubectl get nodes

20. On the control plane node, install the Calico networking add-on:
    kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml

21. On the control plane node, view the status of the cluster:
    kubectl get nodes

Note: If you want to set hostnames for each node, use the command sudo hostnamectl set-hostname [k8s-control | k8s-worker1 | k8s-worker2] and place the three entries in each node's hosts file with sudo vi /etc/hosts. The hosts file should contain the
