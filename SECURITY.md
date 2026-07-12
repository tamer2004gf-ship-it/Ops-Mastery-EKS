# Security Policy

## Handling of Credentials and Secrets

No credentials, tokens, kubeconfig files, private keys, or environment files should ever be committed to this repository.

Secrets must be stored and accessed through a secure secret-management method, such as:

- AWS Secrets Manager
- GitHub Actions Secrets
- Environment variables injected at deploy/runtime
- Another approved secret-management service

## Reporting a Vulnerability or Exposure

If you discover a credential, secret, or other sensitive value committed to this repository, please report it privately rather than opening a public GitHub issue.

## Accidental Commits

If a secret is accidentally committed:

1. Treat the exposed value as compromised immediately.
2. Rotate the credential right away through its issuing service.
3. Remove the file from the current branch.
4. Purge the value from Git history.
5. Confirm no other branches, tags, or forks still contain it.
