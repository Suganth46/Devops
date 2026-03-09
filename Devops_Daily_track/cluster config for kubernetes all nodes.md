- apt update
- apt install openssh-server -y  -- connect between powershell and server

- apt install -y apt-transport-https ca-certificates curl gpg
- mkdir -p /etc/apt/keyrings

```
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
```

```
echo "deb \\\[signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /" | tee /etc/apt/sources.list.d/kubernetes.list
```

* apt install -y containerd
- sudo mkdir -p /etc/containerd
- sudo containerd config default | sudo tee /etc/containerd/config.toml
- sudo systemctl restart containerd
- sudo systemctl enable containerd
- apt update
- apt install -y kubelet kubeadm kubectl
- apt-mark hold kubelet kubeadm kubectl
- sudo swapoff -a
- free -m

---

# After cloning

- sudo hostnamectl set-hostname k8nworker1
- sudo nano /etc/hosts
- sudo nano /etc/netplan/01-netcfg.yaml -- write code

```
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: no
      addresses:
        - 10.92.185.54/24
      gateway4: 10.92.185.1
      nameservers:
        addresses: \\\[8.8.8.8,8.8.4.4]
```

- sudo netplan apply



# master

- sudo kubeadm init --pod-network-cidr=192.168.0.0/16

### if above comment is not work

- kubeadm version
- lsmod | grep br\_netfilter
- sudo modprobe br\_netfilter
- echo br\_netfilter | sudo tee /etc/modules-load.d/k8s.conf
- cat /proc/sys/net/bridge/bridge-nf-call-iptables
- echo "net.bridge.bridge-nf-call-iptables = 1" | sudo tee /etc/sysctl.d/k8s.conf
- echo "net.ipv4.ip\_forward = 1" | sudo tee -a /etc/sysctl.d/k8s.conf
- sudo sysctl --system
- sudo kubeadm reset -f
- sudo kubeadm init --pod-network-cidr=192.168.0.0/16

---
Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

Alternatively, if you are the root user, you can run:

  export KUBECONFIG=/etc/kubernetes/admin.conf

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

Then you can join any number of worker nodes by running the following on each as root:
```
kubeadm join 10.221.248.137:6443 --token 4itquq.linq7935lnkmw0t2 --discovery-token-ca-cert-hash sha256:603ee45168e5b1f1640724836b709ba2253227a29b838f21778d3088d868d4f3
```
---

# master
 - mkdir -p $HOME/.kube

 - sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

 - sudo chown $(id -u):$(id -g) $HOME/.kube/config

 - kubectl get nodes
 - systemctl status containerd

 - systemctl status kubelet

 - sudo crictl ps

---
- kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml

