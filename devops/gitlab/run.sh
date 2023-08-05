## NFS
mkdir -p /share/gitlab/{config,logs,data}
chmod 777 -R /share/gitlab/

mkdir -p /share/gitlab-runner
chmod 777 -R /share/gitlab-runner

## Docker images
docker pull gitlab/gitlab-ce:16.2.2-ce.0
docker pull gitlab/gitlab-runner:alpine-v16.2.0

## LoadDockerImage
kind load  docker-image gitlab/gitlab-ce:16.2.2-ce.0 --name devopscluster
kind load  docker-image gitlab/gitlab-runner:alpine-v16.2.0 --name devopscluster

## ArgoAPP
kubectl -n argocd apply -f gitlab-argoapp.yaml
