# Christina Profile

This directory contains the configuration and settings for the Christina Hermes profile.

## Overview
Christina is a separate Hermes profile with her own API key and Telegram bot access.

## Configuration Details
- API Provider: Alibaba DashScope
- API Key: Provided separately (not stored in plaintext here for security)
- API Host: ws-qyvn7wrf5e4v4n76.ap-southeast-1.maas.aliyuncs.com
- Platform: Telegram

## Files
- `config.yaml` - Main configuration for this profile
- `platforms/telegram-config.json` - Telegram bot configuration
- `platforms/pairing/` - Approved Telegram users (empty by default)

## Setup Instructions
1. Create a new Telegram bot via BotFather
2. Replace "YOUR_TELEGRAM_BOT_TOKEN_HERE" with the actual bot token
3. Add approved users to the approved_users section