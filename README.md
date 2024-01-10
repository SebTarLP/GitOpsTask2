**TASK2 FULL STACK CLOUD PROGRAMMING**

Steps to follow before starting the task:
1. Configure GitHub CLI -> https://docs.github.com/en/github-cli/github-cli/quickstart
   - sudo apt update (for Ubuntu)
   - sudo apt install gh (for Ubuntu)
   - sudo auth login (verbose, user will be asked for account, protocol, etc.)
3. Create Access Token on GitHub (access to: project, repo, workflow)-> https://docs.github.com/en/enterprise-server@3.9/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token
5. Add secret with Access Token to repository -> https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository
   - gh secret set "SECRET_NAME" (verbose, user will be asked to enter value for a secret)
7. Create repositories. Repositories can be created via GitHub CLI -> https://cli.github.com/manual/gh_repo_create
   - git init -b "BRANCH
   - git add .
   - git commit -m "COMMENT"
   - gh repo create (verbose, user will be asked about what to do with repository)

Two repositories are needed to perform the task:

SourceRepo - contains an index.html file with te website layout, a Dockerfile and a GitHub Actions configuration.

ConfigRepo - contains files necessary to create a Kubernetes environment: Deployment, Ingress and NodePort type Service.

Next step is to crate files in repositories:
1. Create index.html -> Basic HTML skeleton including name, surname and version of application.
2. Create Dockerfile -> Use nginx:latest image and copy index.html file to html folder under nginx directory.
3. Crate GitHub Actions file -> Should allow to build image for selected hardware architectures (amd64 and arm64), assign new tag and upload the image to a public repo on DockerHub and modify deployment.yaml file in ConfigRepo.
4. Create deployment.yaml -> Based on the developed image and having 4 replicas. Should allow to maintain a maximum of five pods within application and limit the minimum number of running pods to two.
5. Create ingress.yaml -> Allows external access to application.
6. Create service.yaml -> NodePort type Service for application.

Next step is to configure access to DockerHub:
1. Create Access Token on DockerHub -> https://docs.docker.com/security/for-developers/access-tokens/#create-an-access-token
2. Add secrets with DockerHub Username and Access Token to repository -> https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository

Next step is to run GitHub Actions:
1. It can be done via GitHub CLI -> https://cli.github.com/manual/gh_workflow_run or manually from GitHub GUI -> https://docs.github.com/en/actions/using-workflows/manually-running-a-workflow
   - gh workflow run "WORKFLOW_NAME"

At this point we should have the action workflow executed correctly:

![image](https://github.com/SebTarLP/GitOpsTask2/assets/156203191/fcb7087e-063a-48a9-ac83-77f03c348713)

The content of the deployment.yaml file should change where the image name for the container is located along with the tag:

![image](https://github.com/SebTarLP/GitOpsTask2/assets/156203191/e05ff383-a6b8-452a-8bcf-23000553e2a2)

Also, different versions of the image should be visible in DockerHub:

![image](https://github.com/SebTarLP/GitOpsTask2/assets/156203191/8074463c-9795-48fa-bbd3-0cc5614cb88a)

Next step is to create Dockerfile in main repository:
1. Create Dockerfile -> Using latest alpine image. Image should have access to git, curl and kubectl commands.

Next step is to build and push image:
1. Building image -> https://docs.docker.com/engine/reference/commandline/build/
   - docker build -t "USERNAME/IMAGE_NAME:TAG"
3. Pushing image -> https://docs.docker.com/engine/reference/commandline/push/
   - docker push "USERNAME/IMAGE_NAME:TAG"

Next step is to create CronJob object:
1. Create operator.yaml file -> Has to run every two minutes. It should copy contents of the ConfigRepo to /temp dir initializing the application update process.
2. For the cronjob to work it is necessary to define a ServiceAccoun object and ClusterRoleBinding object in order to gran permission to change cluster resources.
   - kubectl create sa gitops
   - kubectl create clusterrolebinding gitops-admin --clusterrole=cluster-admin --serviceaccount default:gitops
4. Last step is to run the cronjob from the operator.yaml configuration file.

At this point we should have the image placed in DockerHub:

![image](https://github.com/SebTarLP/GitOpsTask2/assets/156203191/dc5b78cd-8c99-43eb-b6f0-9083d6b68bc9)

Next step is to make webapplication available at http://zad2.lab:
1. First, map the ip address of the minikube cluster to the given name in /etc/hosts file.
   - "CLUSTER_IP" "NAME"
2. Setup minikube tunnel to forward ip address.
   - minikube tunnel
3. Open a browser and type "http://zad2.lab" into the url search bar.

At this point we should have our index.html file content shown in browser:

![image](https://github.com/SebTarLP/GitOpsTask2/assets/156203191/a0720984-4078-428e-b4f4-41215dd9ef65)

Last step is to test if our CI/CD chain works:
1. Change index.html file content. Change version 1.1 -> 2.1.
2. Commit and push.
3. Rerun workflow - change tag.

Changing tag in workflow in GitHub GUI:
![image](https://github.com/SebTarLP/GitOpsTask2/assets/156203191/5e1b349b-055b-4799-9e97-d61f17877774)

Changing tag in workflow in GitHub CLI:
   - gh workflow run "WORKFLOW_NAME" -f tag=2.1

New image version in DockerHub:

![image](https://github.com/SebTarLP/GitOpsTask2/assets/156203191/70684593-8bfb-4a78-bf7d-565bf6b6a463)

New website content:

![image](https://github.com/SebTarLP/GitOpsTask2/assets/156203191/46411723-dd21-49be-9d9d-2d49feff4f06)

