# Syncing a Local Markdown Notebook Folder with GitHub

This document explains how to sync an existing local folder containing Markdown files (`~/notebook`) with a GitHub repository using Git and SSH.
It assumes no prior experience with the creation of a repository and use of push, pull and sync commands in Git.

---

## Table of Contents

1. Overview
2. Prerequisites
3. Installing and Configuring Git
4. Creating the GitHub Repository
5. Setting Up SSH Authentication
6. Connecting the Local Notebook Folder to GitHub
7. Day-to-Day Sync Workflow
8. One-Line Sync Command
9. Optional Shell Alias (bash & zsh)

---

## 1. Overview

The goal is to:

* Take an existing local folder (`~/notebook`)
* Track it with Git
* Sync it to GitHub using SSH
* Use a simple workflow for future updates

---

## 2. Prerequisites

* A GitHub account
* A local folder at `~/notebook` containing Markdown files
* Debian-based Linux system
* Terminal access

---

## 3. Installing and Configuring Git

Install Git:

```bash
sudo apt update
sudo apt install git
```

Configure your identity (use the email associated with GitHub):

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

Set the default branch name:

```bash
git config --global init.defaultBranch main
```

---

## 4. Creating the GitHub Repository

On GitHub:

* Create a new repository named `notebook`
* Do **not** initialize it with a README, license, or `.gitignore`

The SSH URL will look like:

```text
git@github.com:tnytxt/notebook.git
```

---

## 5. Setting Up SSH Authentication (One-Time)

Check for existing SSH keys:

```bash
ls -la ~/.ssh
```

If `id_ed25519` does not exist, create one:

```bash
ssh-keygen -t ed25519 -C "your_github_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

Copy the public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

Add it to GitHub:

* GitHub → Settings → SSH and GPG keys → New SSH key

Test the connection:

```bash
ssh -T git@github.com
```

---

## 6. Connecting the Local Notebook Folder to GitHub

Navigate to your notebook folder:

```bash
cd ~/notebook
```

Initialize Git and make the first commit:

```bash
git init
git add .
git commit -m "Initial commit of notebook"
```

Connect the GitHub repository and push:

```bash
git remote add origin git@github.com:tnytxt/notebook.git
git branch -M main
git push -u origin main
```

Verify the remote:

```bash
git remote -v
```

Expected output:

```text
origin  git@github.com:tnytxt/notebook.git (fetch)
origin  git@github.com:tnytxt/notebook.git (push)
```

---

## 7. Day-to-Day Sync Workflow

From inside `~/notebook`:

Pull changes:

```bash
git pull
```

Stage and commit changes:

```bash
git add .
git commit -m "Update notebook"
```

Push to GitHub:

```bash
git push
```

Check status at any time:

```bash
git status
```

---

## 8. One-Line Sync Command

A single command to pull, commit, and push:

```bash
git pull && git add . && git commit -m "Update notebook" && git push
```

If you want a version that does not fail when there are no changes:

```bash
git pull && git add . && git diff --cached --quiet || git commit -m "Update notebook" && git push
```

---

## 9. Optional Shell Alias

To make syncing faster, add this to `~/.bashrc` or `~/.zshrc`:

```bash
alias gsync='git pull && git add . && git diff --cached --quiet || git commit -m "Update notebook" && git push'
```

Reload your shell or restart the terminal.

Then sync with:

```bash
gsync
```

---

**End of export**
