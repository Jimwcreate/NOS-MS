#!/bin/bash

# ========================================================
# 🚀 AUTOMATED NETLIFY DEPLOYMENT SCRIPT
# MERN School Management System
# ========================================================

echo ""
echo "========================================================"
echo "🚀 MERN School Management System - Netlify Deployment"
echo "========================================================"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo -e "${RED}❌ Git repository not found!${NC}"
    echo "Please initialize git first: git init"
    exit 1
fi

# Check if remote is configured
if ! git remote -v | grep -q origin; then
    echo -e "${RED}❌ GitHub remote not configured!${NC}"
    echo "Please set up GitHub remote first:"
    echo "git remote add origin https://github.com/yourusername/yourrepo.git"
    exit 1
fi

echo -e "${GREEN}✅ Git repository configured${NC}"
echo ""

# Check for required files
if [ ! -f "netlify.toml" ]; then
    echo -e "${RED}❌ netlify.toml not found!${NC}"
    exit 1
fi

if [ ! -f "netlify/functions/api.js" ]; then
    echo -e "${RED}❌ Netlify function not found!${NC}"
    exit 1
fi

if [ ! -f "frontend/package.json" ]; then
    echo -e "${RED}❌ Frontend package.json not found!${NC}"
    exit 1
fi

if [ ! -f "backend/package.json" ]; then
    echo -e "${RED}❌ Backend package.json not found!${NC}"
    exit 1
fi

echo -e "${GREEN}✅ All required files present${NC}"
echo ""

# Check for environment files
if [ ! -f "backend/.env.example" ]; then
    echo -e "${RED}❌ backend/.env.example not found!${NC}"
    exit 1
fi

if [ ! -f "frontend/.env.example" ]; then
    echo -e "${RED}❌ frontend/.env.example not found!${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Environment templates present${NC}"
echo ""

# Generate JWT secret
echo -e "${BLUE}🔐 Generating JWT secret...${NC}"
JWT_SECRET=$(node -e "console.log(require('crypto').randomBytes(32).toString('hex'))" 2>/dev/null)
if [ -z "$JWT_SECRET" ]; then
    echo -e "${RED}❌ Failed to generate JWT secret. Make sure Node.js is installed.${NC}"
    exit 1
fi
echo -e "${GREEN}✅ JWT Secret generated: ${JWT_SECRET:0:10}...${NC}"
echo ""

# Commit and push changes
echo -e "${BLUE}📤 Committing and pushing to GitHub...${NC}"
git add .
git commit -m "🚀 Deploy to Netlify with serverless backend - Complete MERN stack" --allow-empty
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Git commit failed!${NC}"
    exit 1
fi

git push origin main
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Git push failed! Check your GitHub credentials.${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Code pushed to GitHub successfully!${NC}"
echo ""

# Display deployment instructions
echo "========================================================"
echo "🎉 READY FOR NETLIFY DEPLOYMENT!"
echo "========================================================"
echo ""
echo "📋 NEXT STEPS:"
echo ""
echo "1. 📊 Create MongoDB Atlas Database:"
echo "   • Go to: https://mongodb.com/cloud/atlas"
echo "   • Create free cluster"
echo "   • Create database user"
echo "   • Whitelist IP: 0.0.0.0/0"
echo "   • Copy connection string"
echo ""
echo "2. 🌐 Deploy to Netlify:"
echo "   • Go to: https://app.netlify.com"
echo "   • Click \"Add new site\" → \"Import existing project\""
echo "   • Select GitHub → Choose your repository"
echo "   • Build settings:"
echo "     - Base directory: (leave empty)"
echo "     - Build command: npm run build:all"
echo "     - Publish directory: frontend/build"
echo "     - Functions directory: netlify/functions"
echo ""
echo "3. 🔧 Add Environment Variables:"
echo "   • Click \"Advanced\" → \"New variable\""
echo "   • MONGODB_URL = [your MongoDB connection string]"
echo "   • JWT_SECRET = $JWT_SECRET"
echo "   • NODE_ENV = production"
echo ""
echo "4. 🚀 Click \"Deploy site\" and wait 3-5 minutes!"
echo ""
echo "========================================================"
echo "📝 IMPORTANT REMINDERS:"
echo "========================================================"
echo ""
echo "• Your site will be live at: https://yoursite.netlify.app"
echo "• API endpoint: https://yoursite.netlify.app/.netlify/functions/api"
echo "• Free tier: 125,000 requests/month"
echo "• Auto-deploys on GitHub push"
echo ""
echo "📖 Documentation:"
echo "• DEPLOY_NOW_NETLIFY.md - Quick start guide"
echo "• NETLIFY_FUNCTIONS_DEPLOY.md - Complete reference"
echo ""
echo "🆘 Need help?"
echo "• Check NETLIFY_FUNCTIONS_DEPLOY.md → Debug Issues"
echo "• Browser console (F12) for API errors"
echo "• Netlify dashboard → Deploys → Logs"
echo ""
echo "========================================================"
echo "🎊 DEPLOYMENT PREPARED SUCCESSFULLY!"
echo "========================================================"
echo ""
echo "Your MERN School Management System is ready to deploy!"
echo "Follow the steps above to go live in 10 minutes. 🚀"
echo ""