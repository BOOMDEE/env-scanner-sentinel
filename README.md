# 🛡️ Env Sentinel (环境哨兵)

![GitHub release](https://img.shields.io/github/v/release/BOOMDEE/env-sentinel?color=blue&style=flat-square)
![License](https://img.shields.io/badge/License-CC%20BY--NC%204.0-red?style=flat-square)

> 💡 **痛点 (Pain Point):** 你是否曾经历过失手将 `.env` 配置文件推送到 GitHub 的尴尬与惊慌？  
> 💡 Have you ever experienced the panic of accidentally pushing a `.env` file to GitHub?

**Env Sentinel** 是一个轻量级、零成本的 GitHub Action。  
**Env Sentinel** is a lightweight, zero-cost GitHub Action.

它不依赖第三方服务器，利用 GitHub 免费算力，自动巡检你账号下**所有仓库**（公开/私有）的物理文件与代码内容。  
It runs on GitHub's free compute to scan **all repositories** (public & private) for leaked files and secrets without third-party servers.

---

## ✨ 核心特性 (Key Features)

* ⚡ **极致效率**：使用 `git clone --depth 1` 浅克隆，秒级完成扫描。  
* ⚡ **High Efficiency**: Uses `git clone --depth 1` shallow clone for lightning-fast scanning.
* 🔍 **双重防御机制**：不仅检查 `.env` 等敏感文件，还通过正则扫描代码中的硬编码密钥（如 `API_KEY = "xxx"`）。  
* 🔍 **Dual-Layer Defense**: Checks for sensitive files like `.env` AND scans code for hardcoded secrets (e.g., `API_KEY = "xxx"`).
* 🛎️ **原生无缝报警**：一旦发现泄露，自动通过 resend API 秒级发送邮件通知。
* 🛎️ Instant Email Alerts: Aborts workflow upon detection and sends instant email notifications via Resend API in seconds.

---

## 🚀 快速开始 (Quick Start)

在你的**env-scanner-sentinel 仓库**中创建 `.github/workflows/scan.yml`
Create `.github/workflows/scan.yml` in your own **env-scanner-sentinel repository**

请前往本仓库的 [Releases](../../releases) 复制最新的actions文件。  
Please go to this repository's [Releases](../../releases) and copy the latest file.
