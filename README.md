# 📝 Basic Jira Clone in Rails 7

![Ruby](https://img.shields.io/badge/Ruby-3.1%2B-red?logo=ruby)
![Rails](https://img.shields.io/badge/Rails-7.0-red?logo=rubyonrails)
![Postgres](https://img.shields.io/badge/PostgreSQL-14-blue?logo=postgresql)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE.md)

A simplified **ticket tracking system** inspired by Jira, built with **Ruby on Rails 7**.  
The app supports **user authentication, role-based authorization, ticket workflows, comments, and ticket history tracking**.  

---

## 🎯 Goal

The goal of this project was to implement a **basic Jira-like system** with multiple user roles, ticket management, and workflow transitions — while ensuring clean, maintainable Rails code.

---

## 🚀 Features

- **Authentication** (Devise)  
  - Sign up, log in, log out functionality  

- **Authorization** (Pundit)  
  - Role-based access control:
    - **Regular User** → Can create tickets and view only their own  
    - **Developer** → Can view assigned tickets and update their status  
    - **QA** → Can verify tickets and mark them as done  
    - **Admin** → Full access (manage all users & tickets)  

- **Ticket Workflow**  
  - Stages:  
    1. Created  
    2. Assigned to Developer  
    3. In Progress  
    4. Sent to QA  
    5. Marked Done  

- **Ticket Management**  
  - Create, assign, and update tickets  
  - Add **comments** to each ticket  
  - Maintain **complete ticket history** (visible to Admins)  
-**Comments Management**
  - Create , Edit and Destroy comments According to roles
- **Admin Panel**  
  - CRUD operations for **users** and **tickets**  
  - View all ticket activities and histories  

---

## ⚙️ Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-username/rails-jira-clone.git
   cd rails-jira-clone
   ```
2. **Install Dependencies**
   ```bash
   bundle install 
   yarn install
   ```
3. **Setup Database**
   ```bash
   rails db:create db:migrate db:seed
   ```
4. **Run the Server**
   ```bash
   bin/dev
   ```
5. Open in browser: http://localhost:3000
   
# 🌱 Seed Data
  The project includes seed data with predefined roles and users:
  - Admin: admin@example.com / password
  - Developer: dev@example.com / password
  - QA: qa@example.com / password
  - User: user@example.com / password
  - Complete DB sample data to check DB structure
# 🏗️ Design Decisions
- **Models**
  - User → with roles (admin, developer, qa, user)
  - Ticket → title, description, status, assigned user, history tracking
  - Comment → associated with tickets & users
  - TicketHistory → stores changes in status & assignments
- **Roles & Permissions**
  - Implemented using Pundit for clarity and maintainability.
- **Workflow**
  - Managed via enum statuses in Ticket model
  - Transitions are controlled by roles & policies
# 🔄 Example User Flows
- **Ticket Creation (User)**
  - User logs in → Creates a ticket → Ticket starts with status Created.
- **Ticket Assignment (Admin)**
  - Admin assigns the ticket to a Developer.
- **Developer Progress**
  - Developer updates ticket status to In Progress → Later sends to QA.
- **QA Verification**
  - QA verifies the work → Marks ticket as Done.
- **Comments & History**
  - Users and assignees add comments → Admin can view full ticket history.
# 📌 Notes
- Built with Rails 7, Ruby 3+, PostgreSQL, Devise, Pundit
- Focused on simplicity and clarity over complexity
- Can be extended with features like labels, attachments, or notifications
# 📫 Contact
- I'm open to internships , remote jobs , freelance projects, or tech collaboration.
- Hamza Ahmad
🔗 GitHub: HamzaAhmad-098
- 📧 Email: [HamzaxDevelopers](mailto:hamzaxdevelopers1223@gmail.com)
- 🌐 Portfolio: [https://hamzaahmad-098.github.io/Portfolio/](https://hamzaahmad-098.github.io/Portfolio/) 

# ⭐️ Support
If you like this project or learned something, please consider giving a ⭐️ on the repository!
