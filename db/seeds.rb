
# === USERS ===
puts "Seeding users..."
admin     = User.create!(name: "Admin User", email: "admin@example.com", password: "password", role: :admin)
dev       = User.create!(name: "Dev User", email: "dev@example.com", password: "password", role: :developer)
qa        = User.create!(name: "QA User", email: "qa@example.com", password: "password", role: :qa)
reporter  = User.create!(name: "Reporter User", email: "reporter@example.com", password: "password", role: :user)

# === TICKETS ===
puts "Seeding tickets..."
ticket1 = Ticket.create!(
  title: "Login Bug",
  description: "User cannot login using Google OAuth.",
  status: :created,
  creator: reporter,
  developer: dev,
  qa: qa
)

ticket2 = Ticket.create!(
  title: "Crash on payment",
  description: "App crashes when clicking 'Pay Now'",
  status: :in_progress,
  creator: reporter,
  developer: dev,
  qa: qa
)

# === COMMENTS ===
puts "Seeding comments..."
Comment.create!(body: "Working on it.", user: dev, ticket: ticket1)
Comment.create!(body: "Please add logs.", user: qa, ticket: ticket1)
Comment.create!(body: "Logs added.", user: reporter, ticket: ticket1)

# === TICKET HISTORY ===
puts "Seeding ticket history..."
TicketHistory.create!(
  ticket: ticket1,
  user: dev,
  action: "status_change",
  old_value: "open",
  new_value: "in_progress"
)

TicketHistory.create!(
  ticket: ticket1,
  user: qa,
  action: "status_change",
  old_value: "in_progress",
  new_value: "resolved"
)

puts "✅ Done seeding."
