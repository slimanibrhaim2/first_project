# First Project - User Management System 👥

A beautiful and modern user management application built with Phoenix Framework, Elixir, and Tailwind CSS.

## 🚀 Features

- ✅ **User CRUD Operations** - Create, Read, Update, Delete users
- 🎨 **Beautiful UI** - Modern design with Tailwind CSS
- 💫 **Real-time Updates** - Powered by Phoenix LiveView
- 📱 **Responsive Design** - Works on all devices
- 🎯 **Form Validations** - Data integrity and user-friendly error messages
- 🔄 **Live Interactions** - No page refreshes needed

## 📸 Screenshots

### Home Page
Beautiful landing page with quick navigation to user management

### Users List
- Avatar circles with user initials
- Color-coded age badges
- Action buttons (View, Edit, Delete)
- Smooth hover effects

### User Forms
- Color-coded input sections
- Gradient save button
- Real-time validation

## 🛠️ Technologies Used

- **Phoenix Framework** - v1.8
- **Elixir** - Functional programming language
- **Ecto** - Database wrapper and query generator
- **PostgreSQL** - Database
- **Tailwind CSS v4** - Utility-first CSS framework
- **Phoenix LiveView** - Real-time server-rendered HTML

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Elixir** (v1.14 or later)
- **Erlang/OTP** (v25 or later)
- **PostgreSQL** (v14 or later)
- **Node.js** (v18 or later) - for asset compilation

## 🚦 Getting Started

### 1. Clone the Repository

git clone <your-repo-url>
cd first_project### 2. Install Dependencies

# Install Elixir dependencies
mix deps.get

# Install Node.js dependencies
cd assets && npm install && cd ..### 3. Setup Database

# Create the database
mix ecto.create

# Run migrations
mix ecto.migrate### 4. Install Tailwind CSS

mix tailwind.install### 5. Start the Server

mix phx.serverNow visit [`http://localhost:4000`](http://localhost:4000) in your browser! 🎉

## 📂 Project Structure
