# deploy-github.ps1
# Usage: Run from the site folder in PowerShell. Edit the variables below if needed.

$GitHubUser = 'haworthlisa'
$Repo = 'andrewgaddphotography'
$Remote = "https://github.com/$GitHubUser/$Repo.git"

Write-Host "Deploying site to GitHub repository: $GitHubUser/$Repo" -ForegroundColor Cyan

# If you want the script to create the GitHub repo automatically, install GitHub CLI (gh) and uncomment the gh command below.
# gh repo create $GitHubUser/$Repo --public --source=. --remote=origin --push

if (-not (Test-Path ".git")) {
  git init
}

git add .
git commit -m "Deploy site to GitHub Pages" -q

git branch -M main

Write-Host "Adding remote origin: $Remote" -ForegroundColor Yellow
git remote remove origin -ErrorAction SilentlyContinue
git remote add origin $Remote

Write-Host "Pushing to GitHub (main) — you may be prompted for credentials" -ForegroundColor Yellow
git push -u origin main

Write-Host "Done. Next: On GitHub, enable Pages in Settings → Pages, choose branch 'main' and root '/', then save." -ForegroundColor Green
Write-Host "DNS: Create a CNAME record: 'www' → $GitHubUser.github.io and (optional) add GitHub Pages A records for apex domain." -ForegroundColor Green
