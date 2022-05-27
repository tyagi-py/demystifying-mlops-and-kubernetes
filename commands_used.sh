docker run -p 8080:8080 tyagipy/sumit-mlops:first

kubectl create deployment mlops-tutorial --image=tyagipy/sumit-mlops:first
kubectl expose deployment mlops-tutorial --type=LoadBalancer --port=8080
kubectl scale deployment mlops-tutorial --replicas=3
kubectl delete pod mlops-tutorial-58ff5dd898-62l9d
kubectl autoscale deployment mlops-tutorial --max=10 --cpu-percent=70
kubectl edit deployment mlops-tutorial #minReadySeconds: 15
kubectl set image deployment mlops-tutorial mlops-tutorial=tyagipy/sumit-mlopssecond

gcloud container clusters get-credentials in28minutes-cluster --zone us-central1-a --project solid-course-258105
kubectl create deployment mlops-tutorial --image=tyagipy/sumit-mlops:first
kubectl expose deployment mlops-tutorial --type=LoadBalancer --port=8080
kubectl set image deployment mlops-tutorial mlops-tutorial=DUMMY_IMAGE:TEST
kubectl get events --sort-by=.metadata.creationTimestamp
kubectl set image deployment mlops-tutorial mlops-tutorial=tyagipy/sumit-mlopssecond
kubectl get events --sort-by=.metadata.creationTimestamp
kubectl get componentstatuses
kubectl get pods --all-namespaces

kubectl get events
kubectl get pods
kubectl get replicaset
kubectl get deployment
kubectl get service

kubectl get pods -o wide

kubectl explain pods
kubectl get pods -o wide

kubectl describe pod mlops-tutorial-58ff5dd898-9trh2

kubectl get replicasets
kubectl get replicaset

kubectl scale deployment mlops-tutorial --replicas=3
kubectl get pods
kubectl get replicaset
kubectl get events
kubectl get events --sort-by=.metadata.creationTimestamp