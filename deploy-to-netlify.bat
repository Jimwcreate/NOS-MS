@echo off
REM ========================================================
REM 🚀 AUTOMATED NETLIFY DEPLOYMENT SCRIPT
REM MERN School Management System
REM ========================================================

echo.
echo ========================================================
echo 🚀 MERN School Management System - Netlify Deployment
echo ========================================================
echo.

REM Check if git is initialized
if not exist ".git" (
    echo ❌ Git repository not found!
    echo Please initialize git first: git init
    pause
    exit /b 1
)

REM Check if remote is configured
git remote -v | findstr origin >nul
if errorlevel 1 (
    echo ❌ GitHub remote not configured!
    echo Please set up GitHub remote first:
    echo git remote add origin https://github.com/yourusername/yourrepo.git
    pause
    exit /b 1
)

echo ✅ Git repository configured
echo.

REM Check for required files
if not exist "netlify.toml" (
    echo ❌ netlify.toml not found!
    pause
    exit /b 1
)

if not exist "netlify\functions\api.js" (
    echo ❌ Netlify function not found!
    pause
    exit /b 1
)

if not exist "frontend\package.json" (
    echo ❌ Frontend package.json not found!
    pause
    exit /b 1
)

if not exist "backend\package.json" (
    echo ❌ Backend package.json not found!
    pause
    exit /b 1
)

echo ✅ All required files present
echo.

REM Check for environment files
if not exist "backend\.env.example" (
    echo ❌ backend\.env.example not found!
    pause
    exit /b 1
)

if not exist "frontend\.env.example" (
    echo ❌ frontend\.env.example not found!
    pause
    exit /b 1
)

echo ✅ Environment templates present
echo.

REM Generate JWT secret
echo 🔐 Generating JWT secret...
for /f %%i in ('node -e "console.log(require('crypto').randomBytes(32).toString('hex'))" 2^>nul') do set JWT_SECRET=%%i
if "%JWT_SECRET%"=="" (
    echo ❌ Failed to generate JWT secret. Make sure Node.js is installed.
    pause
    exit /b 1
)
echo ✅ JWT Secret generated: %JWT_SECRET:~0,10%...
echo.

REM Commit and push changes
echo 📤 Committing and pushing to GitHub...
git add .
git commit -m "🚀 Deploy to Netlify with serverless backend - Complete MERN stack" --allow-empty
if errorlevel 1 (
    echo ❌ Git commit failed!
    pause
    exit /b 1
)

git push origin main
if errorlevel 1 (
    echo ❌ Git push failed! Check your GitHub credentials.
    pause
    exit /b 1
)

echo ✅ Code pushed to GitHub successfully!
echo.

REM Display deployment instructions
echo ========================================================
echo 🎉 READY FOR NETLIFY DEPLOYMENT!
echo ========================================================
echo.
echo 📋 NEXT STEPS:
echo.
echo 1. 📊 Create MongoDB Atlas Database:
echo    • Go to: https://mongodb.com/cloud/atlas
echo    • Create free cluster
echo    • Create database user
echo    • Whitelist IP: 0.0.0.0/0
echo    • Copy connection string
echo.
echo 2. 🌐 Deploy to Netlify:
echo    • Go to: https://app.netlify.com
echo    • Click "Add new site" → "Import existing project"
echo    • Select GitHub → Choose your repository
echo    • Build settings:
echo      - Base directory: (leave empty)
echo      - Build command: npm run build:all
echo      - Publish directory: frontend/build
echo      - Functions directory: netlify/functions
echo.
echo 3. 🔧 Add Environment Variables:
echo    • Click "Advanced" → "New variable"
echo    • MONGODB_URL = [your MongoDB connection string]
echo    • JWT_SECRET = %JWT_SECRET%
echo    • NODE_ENV = production
echo.
echo 4. 🚀 Click "Deploy site" and wait 3-5 minutes!
echo.
echo ========================================================
echo 📝 IMPORTANT REMINDERS:
echo ========================================================
echo.
echo • Your site will be live at: https://yoursite.netlify.app
echo • API endpoint: https://yoursite.netlify.app/.netlify/functions/api
echo • Free tier: 125,000 requests/month
echo • Auto-deploys on GitHub push
echo.
echo 📖 Documentation:
echo • DEPLOY_NOW_NETLIFY.md - Quick start guide
echo • NETLIFY_FUNCTIONS_DEPLOY.md - Complete reference
echo.
echo 🆘 Need help?
echo • Check NETLIFY_FUNCTIONS_DEPLOY.md → Debug Issues
echo • Browser console (F12) for API errors
echo • Netlify dashboard → Deploys → Logs
echo.
echo ========================================================
echo 🎊 DEPLOYMENT PREPARED SUCCESSFULLY!
echo ========================================================
echo.
echo Your MERN School Management System is ready to deploy!
echo Follow the steps above to go live in 10 minutes. 🚀
echo.
pause
