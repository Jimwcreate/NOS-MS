# NEEMA OASIS SCHOOL MANAGEMENT SYSTEM - Complete Deployment Guide

## 🚀 Quick Start (Development)

### Prerequisites
- Node.js (v14+) and npm
- MongoDB (local or Atlas)
- Git

### 1. Clone & Setup Backend

```bash
cd backend
npm install
```

### 2. Configure Backend Environment

Create/Update `backend/.env`:
```env
MONGO_URL=mongodb://localhost:27017/neema_oasis_school
JWT_SECRET=your-secret-key-change-this
PORT=5000
NODE_ENV=development
```

**MongoDB Connection Options:**

**Option A: Local MongoDB**
```bash
# Windows
mongod

# macOS/Linux
brew services start mongodb-community
# or
mongod
```

**Option B: MongoDB Atlas (Cloud)**
```
1. Go to https://www.mongodb.com/cloud/atlas
2. Create account and cluster
3. Get connection string: mongodb+srv://username:password@cluster.mongodb.net/neema_oasis_school?retryWrites=true&w=majority
4. Update MONGO_URL in .env
```

### 3. Configure Frontend Environment

Create/Update `frontend/.env`:
```env
REACT_APP_BASE_URL=http://localhost:5000
REACT_APP_FIREBASE_API_KEY=optional
REACT_APP_FIREBASE_AUTH_DOMAIN=optional
REACT_APP_FIREBASE_PROJECT_ID=optional
REACT_APP_FIREBASE_STORAGE_BUCKET=optional
REACT_APP_FIREBASE_MESSAGING_SENDER_ID=optional
REACT_APP_FIREBASE_APP_ID=optional
```

### 4. Start Services

**Terminal 1 - Backend:**
```bash
cd backend
npm start
# Expected output: "Server started at port no. 5000"
# "Connected to MongoDB"
```

**Terminal 2 - Frontend:**
```bash
cd frontend
npm start
# Browser opens to http://localhost:3000
```

---

## 📋 Default Login Credentials

### Admin
- **Username/Email:** admin@example.com
- **Password:** 12345678

### Teacher
- **Username/Email:** teacher@example.com
- **Password:** 12345678

### Student
- **Username/Email:** student@example.com
- **Password:** 12345678

---

## ✨ Key Features Implemented

### 1. **Authentication & Authorization**
- ✅ Admin, Teacher, Student login
- ✅ Guest login for demo purposes
- ✅ JWT token-based authentication
- ✅ Role-based access control (RBAC)

### 2. **Admin Dashboard**
- ✅ User management (create, delete, reset password)
- ✅ Class management
- ✅ Student management
- ✅ Teacher management
- ✅ Notice management
- ✅ Complaint management
- ✅ Subject management

### 3. **Student Features**
- ✅ View dashboard
- ✅ View attendance
- ✅ View exam marks
- ✅ View subjects
- ✅ File uploads (assignments, documents)
- ✅ Submit complaints
- ✅ Print reports

### 4. **Teacher Features**
- ✅ View dashboard
- ✅ Mark attendance
- ✅ Enter exam marks
- ✅ View student details
- ✅ Upload class materials
- ✅ File uploads
- ✅ Print performance reports

### 5. **File Management**
- ✅ Document upload (PDF, Word, Excel)
- ✅ Image upload (JPG, PNG, GIF)
- ✅ File download
- ✅ File delete
- ✅ Report export (PDF, CSV)

### 6. **Reporting & Print**
- ✅ Generate PDF reports
- ✅ Export to Excel (CSV)
- ✅ Print functionality
- ✅ Student attendance reports
- ✅ Teacher performance reports
- ✅ Class reports

---

## 🔧 API Endpoints Reference

### Authentication
```
POST /AdminLogin              - Admin login
POST /StudentLogin            - Student login
POST /TeacherLogin            - Teacher login
POST /GuestLogin              - Guest login
POST /AdminReg                - Register new admin (admin-only)
```

### File Management
```
POST /api/upload              - Upload file
GET /api/download/:type/:file - Download file
GET /api/files/:type          - List files
DELETE /api/file/:type/:file  - Delete file
GET /uploads/:type/:file      - Serve static file
```

### User Management
```
POST /DeleteUser              - Delete user (admin-only)
POST /ResetUserPassword       - Reset password (admin-only)
GET /UsersSummary/:id         - Get user statistics (admin-only)
```

### Student
```
POST /StudentReg              - Register student
POST /StudentLogin            - Student login
GET /Students/:id             - List students
GET /Student/:id              - Get student details
PUT /Student/:id              - Update student
DELETE /Student/:id           - Delete student
PUT /StudentAttendance/:id    - Mark attendance
PUT /UpdateExamResult/:id     - Update exam marks
```

### Teacher
```
POST /TeacherReg              - Register teacher
POST /TeacherLogin            - Teacher login
GET /Teachers/:id             - List teachers
GET /Teacher/:id              - Get teacher details
POST /TeacherAttendance/:id   - Mark attendance
```

### Classes
```
POST /SclassCreate            - Create class
GET /Sclass/:id               - Get class details
DELETE /Sclass/:id            - Delete class
```

### Subjects
```
POST /SubjectCreate           - Create subject
GET /SubjectList              - List subjects
DELETE /Subject/:id           - Delete subject
```

### Notices
```
POST /NoticeCreate            - Create notice
GET /NoticeList               - List notices
DELETE /Notice/:id            - Delete notice
```

### Complaints
```
POST /ComplainCreate          - Create complaint
GET /ComplainList             - List complaints
```

---

## 📁 Project Structure

```
MERN-School-Management-System/
├── backend/
│   ├── controllers/          # Business logic
│   │   ├── admin-controller.js
│   │   ├── student_controller.js
│   │   ├── teacher-controller.js
│   │   └── ...
│   ├── models/               # Database schemas
│   ├── routes/               # API endpoints
│   │   ├── route.js
│   │   ├── file-routes.js
│   │   └── report-routes.js
│   ├── middleware/           # Auth, validation
│   ├── utils/                # Helper functions
│   │   └── fileHandler.js
│   ├── uploads/              # Uploaded files
│   │   ├── documents/
│   │   ├── images/
│   │   └── reports/
│   ├── .env                  # Environment config
│   └── index.js              # Server entry point
│
├── frontend/
│   ├── src/
│   │   ├── components/       # Reusable components
│   │   │   ├── ReportPrintExport.js
│   │   │   ├── FileUploadManager.js
│   │   │   └── ...
│   │   ├── pages/
│   │   │   ├── admin/        # Admin pages
│   │   │   ├── student/      # Student pages
│   │   │   ├── teacher/      # Teacher pages
│   │   │   └── LoginPage.js
│   │   ├── redux/            # State management
│   │   ├── services/         # API calls
│   │   ├── App.js
│   │   └── index.js
│   ├── .env                  # Environment config
│   └── package.json
│
└── README.md
```

---

## 🧪 Testing the Application

### 1. Test Login Flow
```
1. Visit http://localhost:3000
2. Click "Choose User"
3. Select "Admin"
4. Login with admin@example.com / 12345678
5. Should redirect to admin dashboard
```

### 2. Test File Upload
```
1. Login as admin/teacher/student
2. Go to appropriate dashboard
3. Upload document/image
4. Verify file appears in list
5. Test download
6. Test delete
```

### 3. Test User Management (Admin Only)
```
1. Login as admin
2. Go to "User Management"
3. Select user type (Student/Teacher/Admin)
4. Find user
5. Test "Reset Password" → verify password reset to 12345678
6. Test "Delete" → verify user is removed
```

### 4. Test Reports & Print
```
1. Login as admin/teacher
2. Navigate to reports section
3. Click "Print" or "Export"
4. Select format (Print/PDF/Excel)
5. Verify output
```

### 5. Test Attendance & Marks
```
1. Login as teacher
2. Navigate to attendance
3. Mark students present/absent
4. Enter exam marks
5. Save and verify
6. Login as student and check attendance/marks
```

---

## 🐛 Troubleshooting

### Backend Issues

**MongoDB Connection Error**
```
Error: NOT CONNECTED TO NETWORK

Solution:
1. Ensure MongoDB is running
2. Check MONGO_URL in backend/.env
3. For Atlas: verify IP whitelist allows your IP
4. Check username/password if using Atlas
```

**Port Already in Use**
```
Error: listen EADDRINUSE: address already in use :::5000

Solution:
1. Kill process on port 5000:
   # Windows
   netstat -ano | findstr :5000
   taskkill /PID <PID> /F
   
   # macOS/Linux
   lsof -ti:5000 | xargs kill -9
2. Or change PORT in backend/.env
```

**File Upload Failed**
```
Error: Upload failed

Solutions:
1. Check file size < 50MB
2. Verify file type is allowed
3. Ensure uploads directory exists (created automatically)
4. Check disk space
```

### Frontend Issues

**API Base URL Not Working**
```
Error: localhost:5000 not found

Solutions:
1. Verify .env has REACT_APP_BASE_URL=http://localhost:5000
2. Restart frontend server: npm start
3. Clear browser cache (Ctrl+Shift+Delete)
4. Check backend is running on port 5000
```

**Login Not Working**
```
Error: Login failed

Solutions:
1. Verify backend is running
2. Check credentials match database
3. Verify JWT_SECRET matches backend
4. Check browser console for errors (F12)
5. Clear localStorage and retry
```

**Can't Upload Files**
```
Error: Upload failed or file not found

Solutions:
1. Ensure you're logged in (not guest)
2. Check file size < 50MB
3. Verify file type is allowed
4. Check backend /api/upload endpoint works
5. Verify backend uploads directory exists
```

---

## 🚀 Production Deployment

### Backend Deployment (Heroku/Railway/Render)

1. **Prepare for production:**
   ```bash
   # backend/.env (production)
   MONGO_URL=<production-mongodb-url>
   JWT_SECRET=<strong-random-secret>
   NODE_ENV=production
   PORT=5000
   ```

2. **Deploy:**
   ```bash
   # For Heroku
   heroku create <app-name>
   git push heroku main
   ```

### Frontend Deployment (Vercel/Netlify/GitHub Pages)

1. **Prepare for production:**
   ```bash
   # frontend/.env (production)
   REACT_APP_BASE_URL=https://your-backend-url.com
   ```

2. **Build:**
   ```bash
   npm run build
   ```

3. **Deploy:**
   ```bash
   # For Vercel
   npm install -g vercel
   vercel
   ```

### Environment Variables Checklist

**Backend:**
- ✅ MONGO_URL (production database)
- ✅ JWT_SECRET (strong, random)
- ✅ NODE_ENV=production
- ✅ PORT (if custom)

**Frontend:**
- ✅ REACT_APP_BASE_URL (production backend URL)
- ✅ REACT_APP_FIREBASE_* (if using Firebase)

---

## 📊 Database Backup & Restore

### MongoDB Local Backup
```bash
# Backup
mongodump --db neema_oasis_school --out ./backup

# Restore
mongorestore ./backup
```

### MongoDB Atlas Backup
```
1. Go to https://cloud.mongodb.com
2. Select cluster
3. Backup & Restore → Backups
4. Click "Backup Now"
```

---

## 🔒 Security Best Practices

1. **Change default credentials** before production
2. **Use strong JWT_SECRET** - minimum 32 characters
3. **Enable HTTPS** in production
4. **Validate all inputs** on backend
5. **Use rate limiting** for API endpoints
6. **Store sensitive data** in environment variables
7. **Keep dependencies updated** - run `npm audit fix`
8. **Use CORS properly** - don't allow all origins in production

---

## 📞 Support & Documentation

- **Backend Docs:** See controller files for endpoint details
- **Frontend Components:** See component files for usage examples
- **Database Schema:** See models/ directory for data structure
- **API Testing:** Use Postman or Insomnia with provided endpoints

---

## ✅ Checklist Before Going Live

- [ ] MongoDB configured and running
- [ ] Backend started successfully
- [ ] Frontend started successfully
- [ ] Can login with test credentials
- [ ] File upload/download works
- [ ] Print/export functionality works
- [ ] All dashboards accessible
- [ ] User management works (admin)
- [ ] Attendance & marks entry works (teacher)
- [ ] Student can view results
- [ ] All environment variables set
- [ ] Database backups configured
- [ ] SSL certificate installed (production)
- [ ] CORS configured for your domain
- [ ] Rate limiting enabled
- [ ] Error logging configured
- [ ] User data privacy checked

---

## 🎉 You're Ready!

Your NEEMA OASIS SCHOOL MANAGEMENT SYSTEM is now fully functional and ready for:
- Development testing
- User training
- Production deployment

For issues or questions, check the troubleshooting section or review the code comments.

**Happy managing! 📚**
