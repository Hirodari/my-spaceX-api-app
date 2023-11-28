create_cluster:
	eksctl create cluster -f ../k8s/cluster.yaml

delete_cluster:
	eksctl delete cluster -f ../k8s/cluster.yaml

describe_cluster:
	eksctl utils describe-stacks --region=us-east-1 --cluster=spacex-cluster

aws_identity:
	aws sts get-caller-identity

set_context:
	eksctl utils write-kubeconfig --cluster=spacex-cluster --set-kubeconfig-context=true

enable_iam_sa_provider:
	eksctl utils associate-iam-oidc-provider --cluster=spacex-cluster --approve

create_cluster_role:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.4/docs/examples/rbac-role.yaml

create_iam_policy:
	curl -o iam_policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.2.0/docs/install/iam_policy.json
	aws iam create-policy \
		--policy-name AWSLoadBalancerControllerIAMPolicy \
		--policy-document file://iam_policy.json

create_service_account:
	eksctl create iamserviceaccount \
      --cluster=spacex-cluster \
      --namespace=kube-system \
      --name=aws-load-balancer-controller \
      --attach-policy-arn=arn:aws:iam::116429386222d:policy/AWSLoadBalancerControllerIAMPolicy \
      --override-existing-serviceaccounts \
      --approve
	  
deploy_ingress_nginx:
	kubectl apply ../k8s/ingress-nginx-deploy.yaml

deploy_cert_manager:
	kubectl apply ../k8s/cert-manager.yaml

revert_cert_manager:
	kubectl delete ../k8s/cert-manager.yaml
		
deploy_ingress_controller:
	kubectl apply -f ../k8s/ingress-nginx-deploy.yaml

deploy_application:
	# kustomize build ./k8s | kubectl apply -f -
	kubectl apply -f ../k8s/configs/
delete_application:
	kubectl delete -f ../k8s/configs/