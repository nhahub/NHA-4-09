# 📦 NHA – Mental Wellness & Therapy App  

A modern **Flutter mental wellness application** focused on helping users improve their emotional well-being through mood tracking, therapist interaction, meditation content, and community support.  

Built using **Clean Architecture** with **BLoC/Cubit** state management for scalability, maintainability, and high performance.

---

# 📖 About  

NHA is an all-in-one mental wellness platform that combines:
- Mood tracking
- Meditation & relaxing content
- Therapist booking & communication
- Community interaction
- Personalized meal & wellness recommendations
- Subscription & premium services

The project follows a modular feature-based architecture and integrates multiple real-world services such as authentication, payments, chat systems, and media players.

---

# 🚀 Features  

## 🔐 Authentication
- Login & Register
- Forgot Password
- Reset Password
- Logout functionality
- Secure authentication flow

---

## 🚀 Onboarding & Questionnaire
- Interactive onboarding screens
- User questionnaire system
- Personalized setup experience

---

## 🏠 Home
- Dynamic home dashboard
- Daily wellness statistics
- Mood progress section
- Daily quotes/messages
- Water tracking system
- Activities recommendations
- Upcoming booked sessions

---

## 😊 Mood Tracking & Recommendations
- Mood progress analytics
- Mood tracking system
- Personalized recommendations
- Mood-based wellness suggestions

---

## 🥗 Meals Recommendations
- Recommended meals based on mood/state
- Food recommendation categories
- Local recommendation services

---

## 🧘 Meditations & Relaxation
- Meditation content
- ASMR section
- Podcasts
- Recommended videos
- Recommended books
- Recommended articles
- Audio player
- Video player support

---

## 👨‍⚕️ Therapist System
- Therapist listing
- Therapist details
- Therapist reviews
- Booking sessions
- Real-time therapist chat

---

## 💬 Community
- Community feed
- Create posts
- Comments system
- Social interaction features

---

## 🤖 AI Chatbot
- Built-in chatbot support
- Instant wellness assistance

---

## 💳 Payments & Premium
- Subscription system
- Premium offers
- Stripe integration
- PayPal integration
- Add card functionality
- Payment processing
- Thank you/payment success flow

---

## ⚙️ Settings & Profile
- Update profile
- Privacy policy
- Terms & conditions
- App rating
- Feedback system
- Subscription upgrade
- About screen
- Logout support

---

# 🏗️ Architecture  

The project follows **Clean Architecture** with clear separation of concerns:

```text
Feature
│
├── data
│   ├── models
│   ├── repos
│   ├── services
│
├── domain
│   ├── entities
│   ├── enums
│   ├── repos
│
├── presentation
│   ├── views
│   ├── widgets
│   ├── manager (Cubit/BLoC)
```

---

# 🧠 State Management  

The app uses:
- **Flutter BLoC / Cubit**
- Feature-based state management
- Reactive UI updates

Examples:
- Authentication Cubits
- Payment Cubits
- Community Feed Cubits
- Therapist Chat Cubits
- Mood Recommendation Cubits
- Audio/Video Player Cubits

---

# 🛠️ Tech Stack  

- Flutter
- Dart
- Clean Architecture
- BLoC / Cubit
- Supabase
- Stripe Payments
- PayPal Integration
- Real-time Chat
- Audio & Video Players

---

# 📂 Main Features Structure  

```text
lib/features
│
├── auth
├── onboarding
├── home
├── mood
├── meditations
├── therapist
├── community
├── chatbot
├── payment
├── meals_recommendations
├── settings
├── main
└── app
```

---

# 📱 Core Modules  

| Module | Description |
|---|---|
| Auth | Authentication & account management |
| Home | Dashboard & daily tracking |
| Mood | Mood analytics & recommendations |
| Therapist | Booking, reviews & chat |
| Community | Posts & comments |
| Meditations | Relaxing media content |
| Payments | Premium subscriptions |
| Chatbot | AI-powered assistant |
| Settings | Profile & app preferences |

---

# 📸 Screenshots  

## Authentication  
- Login  
- Register  
- Forgot Password  
- Reset Password  

## Home  
- Daily Stats  
- Water Tracking  
- Mood Progress  
- Activities  

## Mood  
- Mood Tracking  
- Recommendations  

## Meditations  
- Podcasts  
- ASMR  
- Audio Player  
- Videos  
- Articles  
- Books  

## Therapist  
- Therapist Details  
- Reviews  
- Booking  
- Chat  

## Community  
- Feed  
- Posts  
- Comments  

## Payments  
- Premium Offers  
- Stripe & PayPal  
- Subscription Screens  

## Settings  
- Profile  
- Feedback  
- Privacy Policy  
- Terms & Conditions  

---

# 🚀 Getting Started  

## Prerequisites
- Flutter SDK
- Dart SDK
- Android Studio / VS Code
- Supabase configuration

---

## Installation  

```bash
git clone https://github.com/nhahub/NHA-4-009.git
cd NHA-4-009
flutter pub get
flutter run
```

---

# 📩 Contact  

## 👨‍💻 Developer
Karem Motaz  

📧 Email: karemmotaz2929@gmail.com  

🌐 LinkedIn:  
https://www.linkedin.com/in/karem-motaz-bb55a9213/

---

# ⭐ Project Highlights  

- Feature-based scalable architecture  
- Real-world payment integrations  
- Modular Cubit state management  
- Mental wellness focused UX  
- Rich multimedia experience  
- Community & therapist ecosystem

## 📱 Preview  

### Cover App Preview  
![Cover App Preview](assets/moodly_app_presentation/1.png)  

### Welcome To Moodly  
![Welcome To Moodly](assets/moodly_app_presentation/2.png)  

### Auth Screens  
![Auth Screens](assets/moodly_app_presentation/3.png)  

### Onboarding Screen 
![Onboarding Screen](assets/moodly_app_presentation/4.png)  

### Questionnaire Screens
![Questionnaire Screens](assets/moodly_app_presentation/5.png)  

### Premium Screen 
![Premium Screen](assets/moodly_app_presentation/6.png) 

### Home Screen 
![Home Screen](assets/moodly_app_presentation/7.png)  

### Water Tracking Screen 
![Water Tracking Screen](assets/moodly_app_presentation/8.png)  

### Recommended Food Screens  
![Recommended Food Screens](assets/moodly_app_presentation/9.png)  

### Food Detailes Screens  
![Food Detailes Screens](assets/moodly_app_presentation/10.png)  

### Mood Recommendations Screen  
![Mood Recommendations Screen](assets/moodly_app_presentation/11.png)  

### Meditation Screens  
![Meditation Screens](assets/moodly_app_presentation/12.png)  

### Therapist Screens  
![Therapist Screens](assets/moodly_app_presentation/13.png)  

### Therapist Reviews Screens  
![Therapist Reviews Screens](assets/moodly_app_presentation/14.png)  

### Booking Sessions Screens  
![Booking Sessions Screens](assets/moodly_app_presentation/15.png)  

### Live Screen  
![Live Screen](assets/moodly_app_presentation/16.png)  

### Chat Screen  
![Chat Screen](assets/moodly_app_presentation/17.png)  

### Community Screen  
![Community Screen](assets/moodly_app_presentation/18.png)  

### Meditations Screen  
![Meditations Screen](assets/moodly_app_presentation/19.png)  

### Audio Screen  
![Audio Screen](assets/moodly_app_presentation/20.png)  

### Chatbot Screen  
![Chatbot Screen](assets/moodly_app_presentation/21.png)  

### Payment Screens  
![Payment Screens](assets/moodly_app_presentation/22.png)  

### Settings Screen  
![Settings Screen](assets/moodly_app_presentation/23.png)  

### Profile Screen  
![Profile Screen](assets/moodly_app_presentation/24.png)  

### Settings Screens Continue  
![Settings Screens Continue](assets/moodly_app_presentation/25.png)  

### Logout Screen  
![Logout Screen](assets/moodly_app_presentation/26.png)  

### Thank You  
![Thank You](assets/moodly_app_presentation/27.png)  

---

## 🛠️ Tech Stack  
- **Flutter** (Clean Architecture + BLoC/Cubit)  
- **Supabase / API** (Authentication & Database)  
- **Real-time Features** (Chat & Live Sessions)  

---

## 📩 Contact  

If you’d like to collaborate or learn more:  
📧 Email: [karemmotaz2929@gmail.com]  
🌐 LinkedIn: [https://www.linkedin.com/in/karem-motaz-bb55a9213/]  

---
