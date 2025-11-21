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

```bash
git clone <your-repo-url>
cd first_project
```

### 2. Install Dependencies

```bash
# Install Elixir dependencies
mix deps.get

# Install Node.js dependencies
cd assets && npm install && cd ..
```

### 3. Setup Database

```bash
# Create the database
mix ecto.create

# Run migrations
mix ecto.migrate
```

### 4. Install Tailwind CSS

```bash
mix tailwind.install
```

### 5. Start the Server

```bash
mix phx.server
```

Now visit [`http://localhost:4000`](http://localhost:4000) in your browser! 🎉

## 📂 Project Structure

```
lib/
├── first_prject/
│   ├── accounts/           # User business logic
│   │   └── user.ex        # User schema
│   ├── accounts.ex        # Accounts context
│   └── repo.ex           # Database repository
│
├── first_prject_web/
│   ├── components/        # Reusable UI components
│   ├── controllers/       # HTTP controllers
│   ├── live/             # LiveView modules
│   │   └── user_live/    # User management LiveViews
│   │       ├── index.ex  # Users list page
│   │       ├── form.ex   # New/Edit user form
│   │       └── show.ex   # User detail page
│   └── router.ex         # Route definitions

assets/
├── css/
│   └── app.css          # Tailwind CSS configuration
└── js/
    └── app.js           # JavaScript entry point

priv/
└── repo/
    └── migrations/      # Database migrations
```

## 🗄️ Database Schema

### Users Table

| Column | Type    | Description          |
|--------|---------|----------------------|
| id     | integer | Primary key          |
| name   | string  | User's full name     |
| email  | string  | User's email address |
| age    | integer | User's age           |

## 🎨 UI Components

### Home Page
- Gradient background
- Navigation buttons to users section

### Users List (`/users`)
- Responsive table layout
- Avatar circles with gradient backgrounds
- Age badges
- Action buttons with hover effects

### User Forms (`/users/new`, `/users/:id/edit`)
- Color-coded input sections
- Real-time validation
- Gradient save button
- Back navigation link

### User Details (`/users/:id`)
- Clean detail view
- Edit and delete actions

## 🔧 Common Commands

```bash
# Start the server
mix phx.server

# Run tests
mix test

# Run tests with coverage
mix test --cover

# Format code
mix format

# Check code quality
mix credo

# Database commands
mix ecto.create      # Create database
mix ecto.migrate     # Run migrations
mix ecto.rollback    # Rollback last migration
mix ecto.reset       # Drop, create, and migrate database

# Generate new migration
mix ecto.gen.migration migration_name
```

## 📚 Learning Resources

### Phoenix Framework
- [Official Guide](https://hexdocs.pm/phoenix/overview.html)
- [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view/)

### Elixir
- [Elixir Getting Started](https://elixir-lang.org/getting-started/introduction.html)
- [Elixir School](https://elixirschool.com/)

### Ecto
- [Ecto Documentation](https://hexdocs.pm/ecto/)
- [Ecto Getting Started](https://hexdocs.pm/ecto/getting-started.html)

## 🤝 Contributing

This is a learning project, but suggestions and improvements are welcome!

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 👨‍💻 Author

**Your Name**
- Learning Phoenix Framework
- Building modern web applications with Elixir

## 🎓 What I Learned

Through this project, I learned:

- ✅ Phoenix Framework basics and project structure
- ✅ Elixir syntax and functional programming concepts
- ✅ Ecto schemas, migrations, and database operations
- ✅ Phoenix LiveView for real-time interactions
- ✅ Tailwind CSS for rapid UI development
- ✅ CRUD operations in a Phoenix application
- ✅ Form handling and validation
- ✅ Routing and navigation in Phoenix

## 🔮 Future Enhancements

Potential features to add:

- [ ] User authentication and authorization
- [ ] Search and filter functionality
- [ ] Pagination for large user lists
- [ ] User profile pictures
- [ ] Export users to CSV
- [ ] Email notifications
- [ ] Admin dashboard
- [ ] API endpoints for mobile apps

## 🐛 Known Issues

None at the moment! 🎉

## 📞 Support

If you have questions or run into issues:

1. Check the [Phoenix Forum](https://elixirforum.com/c/phoenix-forum)
2. Visit [Elixir Slack](https://elixir-slack.community/)
3. Open an issue in this repository

---

**Happy Coding! 🚀**

Made with ❤️ using Phoenix Framework
