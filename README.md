# 🏦 SmartBank — Banking System

A production-ready full-stack banking REST API built with Spring Boot, JWT, MySQL, PDF statements, and an AI chatbot.

## 👨‍💻 Developer

**Sayandwip Ghosh**  
Email: sayandwipghosh007@gmail.com  
B.Tech CSE (AI/ML) — Narula Institute of Technology, MAKAUT

---

## 🚀 Tech Stack

| Layer | Technology |
|---|---|
| Backend | Spring Boot 3.2.5, Java 17 |
| Security | Spring Security + JWT (JJWT 0.11.5) |
| Database | MySQL 8.0 + Hibernate/JPA |
| Email | Gmail SMTP (async) |
| PDF | iTextPDF 5.5.13 |
| API Docs | Swagger / OpenAPI 3 |
| Deployment | Docker, Railway, Render |

---

## ⚙️ Features

- JWT authentication with Role-Based Access Control (ADMIN / USER)
- Account creation, balance enquiry, name enquiry
- Credit, debit, and fund transfer
- PDF bank statement generation with email delivery
- Rule-based banking chatbot
- Async email notifications
- Health check endpoint (`/actuator/health`)

---

## 🔧 Local Development

### Option A — Run with Maven directly
```bash
# Set env vars first (or create .env and export them)
export MYSQL_URL=jdbc:mysql://localhost:3306/bank
export MYSQLUSER=root
export MYSQLPASSWORD=yourpassword
export JWT_SECRET=bXlTdXBlclNlY3JldEtleUZvckJhbmtpbmdTeXN0ZW0xMjM0NTY=
export MAIL_USERNAME=your@gmail.com
export MAIL_PASSWORD=your-app-password

mvn spring-boot:run
```

### Option B — Docker Compose (recommended)
```bash
cp .env.example .env
# Edit .env with your values
docker-compose up --build
```

Access:
- App: `http://localhost:8080`
- Swagger: `http://localhost:8080/swagger-ui/index.html`
- Health: `http://localhost:8080/actuator/health`

---

## ☁️ Deploy on Railway

1. Push this repo to GitHub
2. Go to [railway.app](https://railway.app) → New Project → Deploy from GitHub
3. Add **MySQL** plugin service
4. Set these in Railway **Variables** panel:

| Variable | Value |
|---|---|
| `MYSQL_URL` | From Railway MySQL → Connect tab (JDBC URL) |
| `MYSQLUSER` | From Railway MySQL → Connect tab |
| `MYSQLPASSWORD` | From Railway MySQL → Connect tab |
| `JWT_SECRET` | Any long random string |
| `MAIL_USERNAME` | your Gmail address |
| `MAIL_PASSWORD` | Gmail App Password (16-char) |

Railway auto-detects `Dockerfile` + `railway.toml` ✅

---

## ☁️ Deploy on Render

1. Push this repo to GitHub
2. Go to [render.com](https://render.com) → New → Web Service → Connect repo
3. Environment: **Docker** (auto-detected)
4. Health Check Path: `/actuator/health`
5. Set the same environment variables as Railway above
6. Add a **MySQL** database from Render dashboard

`render.yaml` included for Blueprint auto-deploy ✅

---

## 📋 API Endpoints

| Method | Endpoint | Description | Auth |
|---|---|---|---|
| POST | `/api/user` | Create account | No |
| POST | `/api/user/login` | Login → JWT | No |
| POST | `/api/user/balanceEnquiry` | Check balance | Yes |
| POST | `/api/user/nameEnquiry` | Get name | Yes |
| POST | `/api/user/credit` | Deposit | Yes |
| POST | `/api/user/debit` | Withdraw | Yes |
| POST | `/api/user/transfer` | Transfer | Yes |
| GET | `/bankStatement` | PDF statement | Yes |
| POST | `/chatbot/ask` | Chatbot | No |
| GET | `/actuator/health` | Health check | No |

---

*Developed by Sayandwip Ghosh © 2026*
