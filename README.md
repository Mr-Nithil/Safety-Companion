# Safety Companion

Safety Companion is a Flutter-based personal safety application built to provide fast emergency response tools, trusted-contact communication, and practical safety guidance in one mobile experience.

![Safety Companion Overview](assets/screenshots/Safety%20Companion.png)

## Overview

The app supports secure account access, one-tap emergency calling, live location sharing through SMS, nearby essential-service discovery, and curated safety-awareness content. It is organized with reusable UI modules and service-driven integrations so core safety actions remain quick, focused, and reliable during urgent situations.

Demo: https://www.linkedin.com/posts/nithil-sheshan-4a3945210_flutter-dart-firebase-activity-7448837171865759745-azzM?utm_source=share&utm_medium=member_desktop&rcm=ACoAADWIVHsBQyvJg7MFpZpjndpUXN6v4s4fnlE

## Key Features

- Secure sign up and login with Firebase Authentication
- Automatic auth session handling with route switching between auth and home screens
- Emergency contact registration during onboarding
- One-tap direct emergency call to the saved contact
- Live location sharing via SMS with Google Maps coordinates
- Nearby safety place discovery (police, hospitals, pharmacies, bus stations, fuel stations)
- Quick-access emergency hotlines (police, ambulance, fire brigade, and army)
- In-app safety tips and preparedness articles via integrated web view
- User profile panel with account information and static safety checklist/advice cards
- Curved bottom navigation for fast switching between profile, home, and sign-out sections

## Tech Stack

- Flutter and Dart
- Firebase Core for project initialization
- Firebase Authentication for account management
- Cloud Firestore for user profile and emergency contact storage
- Geolocator for device location retrieval
- flutter_phone_direct_caller for direct phone dialing
- url_launcher for SMS and map deep-link launching
- webview_flutter for in-app article browsing
- carousel_slider for rotating safety-tip cards
- fluttertoast for lightweight user feedback
- curved_navigation_bar for bottom navigation UI
- google_fonts and lottie for visual styling and motion

## Architecture

Safety Companion follows a modular, UI-component-driven Flutter structure:

- Auth flow: authentication screens and auth-state based routing
- Screens layer: top-level containers like home and auth entry points
- Components layer: reusable UI widgets and feature sections
- Services layer: Firebase auth and Firestore interaction logic
- Utils layer: shared styling, constants, and helper widgets such as web view wrappers

This separation keeps feature UI, navigation, and backend integration relatively isolated, making the codebase easier to maintain and extend.

## Patterns and Best Practices

- Firebase auth-state stream based screen gating
- Service abstraction for auth and Firestore operations
- Reusable feature cards for emergency actions and nearby services
- Responsive widget layouts for narrow and wide mobile screens
- Validation for required registration inputs and emergency contact formatting
- Safety-first UX with quick access to call and location actions
- Consistent theme and color system through shared app color utilities

## Screenshots

### Authentication and Home

![Login, Sign Up, and Home Screen](assets/screenshots/Login%20,%20SignUp%20and%20Home%20Screen.png)

### Emergency Contact Calling and Location Sharing

![Emergency Contact Person Call and Location Sharing](assets/screenshots/Emergency%20Contact%20Person%20Call%20and%20Location%20Sharing.png)

### Nearby Safe Places

![Find Near by Safe Places](assets/screenshots/Find%20Near%20by%20Safe%20Places.png)

### Profile and Sign Out

![Profile Screen and SignOut Screen](assets/screenshots/Profile%20Screen%20and%20SignOut%20Screen.png)

## What This Project Demonstrates

This project demonstrates practical Flutter app development for real-world safety use cases, including Firebase-backed authentication, Firestore user data integration, device capabilities (calling, location, SMS), modular UI composition, and user-centric emergency workflows.
