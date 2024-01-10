**TASK2 FULL STACK CLOUD PROGRAMMING**

Steps to follow before starting the task:
1. Configure GitHub CLI -> https://docs.github.com/en/github-cli/github-cli/quickstart
2. Create Access Token on GitHub (access to: project, repo, workflow)-> https://docs.github.com/en/enterprise-server@3.9/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token
3. Add secret with Access Token to repository -> https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository
4. Create repositories. Repositories can be created via GitHub CLI -> https://cli.github.com/manual/gh_repo_create

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
1. 
