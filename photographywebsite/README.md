Andrew Gadd — Photography website

This repository contains a single-page static site (`index.html`) intended to be published with GitHub Pages.

Quick deploy (manual GitHub repo creation):

1. On GitHub create a new repository (example name: `andrewgaddphotography`).
2. In PowerShell run from the site folder:

```powershell
cd "c:\Users\LisaHaworth\OneDrive - Lyndon Group LLC\Desktop\photographywebsite"
git init
git add .
git commit -m "Initial site commit"
git branch -M main
git remote add origin https://github.com/<YOUR_GITHUB_USERNAME>/<REPO>.git
git push -u origin main
```

3. On GitHub go to Settings → Pages. Under "Source" choose `main` branch and `/ (root)` folder, then Save.
4. GitHub Pages will pick up the `CNAME` file (this repo already contains one) and configure the custom domain `www.andrewgaddphotography.com`.
5. In your domain registrar DNS settings, add a CNAME record:
   - Host/Name: `www`
   - Value/Target: `<YOUR_GITHUB_USERNAME>.github.io`
   - TTL: default

6. After GitHub verifies the domain, enable "Enforce HTTPS" in the Pages settings.

Alternative: Use GitHub CLI (if installed) to create and push the repo in one go:

```powershell
cd "c:\Users\LisaHaworth\OneDrive - Lyndon Group LLC\Desktop\photographywebsite"
gh repo create <YOUR_GITHUB_USERNAME>/<REPO> --public --source=. --remote=origin --push
```

DNS notes:
- For the `www` subdomain a CNAME pointing to `<YOUR_GITHUB_USERNAME>.github.io` is the simplest.
- If you want the root/apex domain (`andrewgaddphotography.com`) to serve, add the GitHub Pages A records:
  - 185.199.108.153
  - 185.199.109.153
  - 185.199.110.153
  - 185.199.111.153

If you'd like, tell me your GitHub username and I can give the exact `git remote add` command, or I can provide a GitHub Actions workflow to deploy automatically. I can also walk you through setting DNS at your registrar — tell me which registrar you use.