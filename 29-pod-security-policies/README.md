# Pod Security Polices

### Create the namespace the service account and the rolebinding

`kubectl create namespace psp-example`

`kubectl create serviceaccount -n psp-example psp-user`

```
kubectl create rolebinding -n psp-example psp-editor --clusterrole=edit --serviceaccount=psp-example:psp-user
```

### Create the aliases to reference the users and the namespace

`alias kubectl-admin='kubectl -n psp-example'`

`alias kubectl-user='kubectl --as=system:serviceaccount:psp-example:psp-user -n psp-example'`
 
### Create the pod security policy

`kubectl-admin create -f no-privilege.yaml`

### Try and create a pod with the unprivilged user

```
kubectl-user create -f- <<EOF
apiVersion: v1
kind: Pod
metadata:
  name:      pause
spec:
  containers:
    - name:  pause
      image: k8s.gcr.io/pause
EOF
```

### Check to see if you are allowed to use the policy

`kubectl-user auth can-i use podsecuritypolicy/no-privilege`

### Create a role and a role binding allowing the user to use the pod security policy

```
kubectl-admin create role psp:unprivileged \
    --verb=use \
    --resource=podsecuritypolicy \
    --resource-name=no-privilege
```     
```    
kubectl-admin create rolebinding psp-user:psp:unprivileged \
    --role=psp:unprivileged \
    --serviceaccount=psp-example:psp-user
```    
    
### Check to see if you are allowed to use the policy now

`kubectl-user auth can-i use podsecuritypolicy/no-privilege`


### Now retry creating the pod

```
kubectl-user create -f- <<EOF
apiVersion: v1
kind: Pod
metadata:
  name:      pause
spec:
  containers:
    - name:  pause
      image: k8s.gcr.io/pause
EOF
```

### It works as expected. But any attempts to create a privileged pod should still be denied:

```
kubectl-user create -f- <<EOF
apiVersion: v1
kind: Pod
metadata:
  name:      privileged
spec:
  containers:
    - name:  pause
      image: k8s.gcr.io/pause
      securityContext:
        privileged: true
EOF
```

### Let's try that again, slightly differently

`kubectl-user create deployment pause --image=k8s.gcr.io/pause`

### Check if there are running pods

`kubectl-user get pods`

`kubectl-user get events | head -n 2`

### In order to fix this, bind the psp:unprivileged role to the pod's service account instead. In this case the service account is default:

```
kubectl-admin create rolebinding default:psp:unprivileged \
    --role=psp:unprivileged \
    --serviceaccount=psp-example:default
```

### Delete the namespace and the pod security policy

`kubectl-admin delete ns psp-example`

`kubectl-admin delete psp no-privilege`
