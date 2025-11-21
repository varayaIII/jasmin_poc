# CI/CD Setup Guide

## Quick Setup

1. Generate SSH key:
```bash
ssh-keygen -t ed25519 -f ~/.ssh/github_actions_jasmin -N ""
```

2. Deploy to servers:
```bash
ssh-copy-id -i ~/.ssh/github_actions_jasmin.pub root@192.168.1.101
ssh-copy-id -i ~/.ssh/github_actions_jasmin.pub root@192.168.1.102
```

3. Add GitHub Secrets:
   - Go to: Settings → Secrets and variables → Actions
   - Add: `SSH_PRIVATE_KEY` (content of ~/.ssh/github_actions_jasmin)
   - Add: `PROD_HOST_1` = 192.168.1.101
   - Add: `PROD_HOST_2` = 192.168.1.102

4. Push to GitHub and watch Actions tab!

See full documentation in repository.
