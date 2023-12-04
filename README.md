# k3s-cluster

Create kubernetes cluster, by k3s. All with terraform and ansible.
In this scenario we create 3 machine by terraform. one as control plane and two as worker machine.
qemu-kvm and libvirt have been used to build machines. so be sure that you have the prerequisites on you host.
After the VMs creation, we deploy a kubernetes cluster by k3s.

---

## Prerequisite packages

The following packages are required to launch the project:

- terraform
- ansible
- qemu-kvm
- libvirt
- libvirt-daemon-system
- libvirt-daemon
- virtinst
- xsltproc

> xsltproc is a command line tool for applying XSLT stylesheets to XML documents.

## Create VMs

This provider and the following module are required to implement the virtualization infrastructure on the kvm platform.

- dmacvicar/libvirt
- MonolithProjects/vm/libvirt

To run terraform do:

```
cd vm
terraform init
terraform plan
terraform apply --auto-approve
```

## Install k8s cluster on VMs

```
cd k8s-cluster
ansible-playbook playbook/site.yml -i inventory.yml
```

> Be careful to make a backup of ~/.kube/config before running. Because it will be replaced by the new cluster configuration file. If it did not replace, you can download the configuration file from the control plane machine in path /etc/rancher/k3s/k3s.yaml path.

> Label the worker machines

```
kubectl label node node02 node-role.kubernetes.io/worker=worker
kubectl label node node03 node-role.kubernetes.io/worker=worker
```
