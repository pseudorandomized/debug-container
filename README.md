![CI](https://github.com/pseudorandomized/pod-debugger/actions/workflows/ci.yml/badge.svg)

# Description
A docker image with multiple linux network tools and aws cli pre-installed, for troubleshooting and testing purposes. 
The image is as slim as possible (<100 MB), and you can deploy it to docker daemon, or Kubernetes.

The following tools are installed:
- Basic linux network utilities: `ping`, `nestat`, `nc`, `nmap` etc.
- HTTP utilities: `curl`, `wget` etc.
- DNS utilities: `dig`, `host`, `nslookup` etc.
- TCP utilities: `tcpdump`, `tcptraceroute` etc.
- NFS utils for nfs share mounting (e.g. EKS EFS)
- Nginx web server listening to 80,443 for inbound connectivity testing.

# Usage
## Inline usage:

Simple case:
```bash
kubectl run -it debugger --image=pseudorandomized/pod-debugger bash
```

If you wish to test a Service Account (or any other override to the pod manifest), you can use something like the following:

```bash
kubectl run -it debugger --image=pseudorandomized/pod-debugger --overrides='{ "spec": { "serviceAccount": "your-sa-here" }  }' bash
```

## Manifest:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: debug-pod
spec:
  containers:
    - name: app
      image: pseudorandomized/pod-debugger:latest
      securityContext:
        privileged: true
 # serviceAccountName: ...
 # automountServiceAccountToken: false
 ```
And open a terminal in the pod by:

```bash
kubectl exec -it debug-pod bash
```
