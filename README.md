**TASK2 FULL STACK CLOUD PROGRAMMING**

Steps to follow before starting the task:
1. Configure GitHub CLI -> https://docs.github.com/en/github-cli/github-cli/quickstart
2. Create Access Token on GitHub (access to: project, repo, workflow)-> https://docs.github.com/en/enterprise-server@3.9/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token
3. Add secret with Access Token to repository -> https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository

Two repositories are needed to perform the task:
SourceRepo - contains an index.html file with te website layout, a Dockerfile and a GitHub Actions configuration that includes two jobs: building a Docker image and updating the image tag in the Kubernetes deployment file.
ConfigRepo - contains files necessary to create a Kubernetes environment: Deployment with the definition of the number of replicas, upgrade policy, etc., Ingress to allow external access to applications, and cofiguration of NodePort type Service.

Repositories can be created via GitHub CLI -> https://cli.github.com/manual/gh_repo_create

