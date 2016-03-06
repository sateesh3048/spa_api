user1 = User.create!(name: "Sateesh Kambhampati", email: "sateesh.mca09@gmail.com", password: "welcome123")
user1.create_preference(color: "#3c93ff", font: "22", title: "Awesome App")

user2 = User.create!(name: "Gita Kambhampati", email: "gita.k@gmail.com", password: "test225")
user2.create_preference(color: "#435E46", font: "18", title: "Spa App")
 