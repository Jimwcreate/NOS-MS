# Gmail Authentication Setup Guide

## Overview
The school management system now includes Gmail authentication for sending welcome emails and login notifications to admins and teachers.

## Gmail Setup Steps

### 1. Enable 2-Factor Authentication
1. Go to your Gmail account settings
2. Navigate to Security → 2-Step Verification
3. Enable 2-Step Verification if not already enabled

### 2. Generate App Password
1. After enabling 2-Step Verification, go to Security → App passwords
2. Select "Mail" as the app
3. Select "Other (custom name)" as the device
4. Enter "School Management System" as the custom name
5. Click "Generate"
6. **Copy the 16-character password** (this is your `GMAIL_APP_PASSWORD`)

### 3. Configure Environment Variables
Update your `backend/.env` file with your Gmail credentials:

```env
# Gmail Configuration for Authentication Emails
GMAIL_USER=your-email@gmail.com
GMAIL_APP_PASSWORD=your-16-character-app-password
FRONTEND_URL=http://localhost:3000
```

**Example:**
```env
GMAIL_USER=admin@school.edu
GMAIL_APP_PASSWORD=abcd-efgh-ijkl-mnop
FRONTEND_URL=http://localhost:3000
```

### 4. Restart the Backend
After updating the `.env` file, restart your backend server:

```bash
# Kill existing processes
Get-Process node | Stop-Process -Force

# Start backend
cd backend
npm start
```

## Features Enabled

### Admin Registration
- ✅ Public admin registration (no authentication required for first admin)
- ✅ Welcome email sent to new admins
- ✅ Login notifications for security

### Teacher Registration
- ✅ Welcome email sent to new teachers
- ✅ Login notifications for security

### Password Reset
- ✅ Forgot password functionality for admins and teachers
- ✅ Secure password reset emails with time-limited tokens

## Testing the Setup

1. **Register a new admin** at `http://localhost:3000/Adminregister`
2. **Check your Gmail** for the welcome email
3. **Login as admin** and check for login notification email
4. **Test password reset** functionality

## Troubleshooting

### Email Not Sending
- Verify `GMAIL_USER` and `GMAIL_APP_PASSWORD` are correct
- Check that 2-Factor Authentication is enabled
- Ensure the app password is exactly 16 characters (no spaces)

### Authentication Errors
- Make sure you're using the app password, not your regular Gmail password
- App passwords are different from your login password

### Port Issues
- Backend runs on port 5000
- Frontend runs on port 3000
- Ensure both are running before testing

## Security Notes
- App passwords are specific to this application
- You can revoke app passwords anytime from Gmail settings
- Never share your app password or commit it to version control
- The `.env` file is already in `.gitignore` for security

## Support
If you encounter issues:
1. Check the backend console for error messages
2. Verify all environment variables are set correctly
3. Test with a simple Gmail account first