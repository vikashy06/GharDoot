# GharDoot – Your Local Delivery Partner
> **Official Tagline:** Har Zaroorat, Ghar Tak!

**GharDoot** is a village-based hyperlocal grocery and daily essentials delivery platform connecting rural customers with existing local shops.

---

## 📱 Mobile App Experience for Android & Apple iOS

GharDoot is built as an installable **Progressive Web App (PWA)** optimized for **Android (Google Chrome / Samsung Internet)** and **Apple iOS (iPhone / iPad Safari)**:

### 🤖 For Android Users:
- **1-Click Native Install:** When opening GharDoot in Chrome or Android browsers, a native install prompt or smart banner appears.
- **Home Screen App Icon:** Adds a standalone `< 2 MB` app icon to the Android launcher with splash screen.
- **Offline Village Resilience:** Powered by [sw.js](file:///c:/Users/vikas/OneDrive/Desktop/GharDoot/sw.js) for caching essential catalog data when rural cell signal drops.

### 🍎 For Apple iOS (iPhone & iPad) Users:
- **Apple Mobile Web App:** Configured with `apple-touch-icon`, `apple-mobile-web-app-capable`, `black-translucent` status bar, and viewport safe-area support (`env(safe-area-inset-bottom)` for iPhone notch/home indicator).
- **3-Step Safari Add to Home Screen:**
  1. Open GharDoot in Apple Safari.
  2. Tap the **Share** button (`⎋`).
  3. Tap **"Add to Home Screen"** (`➕`).
- **Interactive iOS Modal:** A step-by-step visual walkthrough modal is built into the site.

### 📱 Native Mobile Bottom Navigation Bar:
On all mobile screens, a native-style fixed bottom bar appears:
- 🏠 **Home:** Quick access to the village storefront.
- 🛍️ **Essentials:** Category browsing and village Kirana spotlight.
- 🛒 **Basket:** Center button with live animated badge counter.
- 📦 **My Orders:** Live order status stepper and delivery tracking.
- 👤 **Profile:** Account management, mobile OTP login, and dashboard access.

---

## 🔐 Multi-Role Authentication & Admin Password System

GharDoot features tailored, secure access for all stakeholders:

1. **Customer & Merchant Login (Mobile Number + OTP):**
   - **Customer:** Enter 10-digit mobile number &rarr; Receive 4-digit SMS OTP &rarr; Access order history and village cart.
   - **Shopkeeper:** Enter merchant mobile number &rarr; Verify OTP &rarr; Access store order packing queue and daily payouts.
   - **Delivery Hero (Doot):** Enter rider phone number &rarr; Verify OTP &rarr; Access delivery route map and cash collection ledger.

2. **Admin Login (Email ID / Mobile No. / Username + Password):**
   - Accessible via the **⚙️ Admin** tab on [login.html](file:///c:/Users/vikas/OneDrive/Desktop/GharDoot/login.html).
   - **Supported Identifiers:**
     - **Email ID:** `admin@ghardoot.in`
     - **Mobile No.:** `9412345678` (or `+91 94123 45678`)
     - **Username:** `admin`
   - **Default Password:** `Admin@123`
   - **Set / Reset Password Feature:** Change password on [login.html](file:///c:/Users/vikas/OneDrive/Desktop/GharDoot/login.html) or in [admin-dashboard.html](file:///c:/Users/vikas/OneDrive/Desktop/GharDoot/admin-dashboard.html).

---

## 📍 Dual Location Detection System

Customers can set their delivery location in two ways:
1. **Detect by Current Location (GPS):**
   - Click the header location pill &rarr; Select *"Detect My Current Location"* &rarr; Uses browser Geolocation API to find nearest village cluster coordinates.
2. **Type Location Manually:**
   - Search by village name (*Rampur, Kishanpur, Shivnagar, Sundarpur*), block, or PIN code with live auto-suggestions.
   - Or fill the detailed custom village address form (Village Name, Ward/Mohalla, Landmark, PIN code).

---

## 📂 Complete Website Pages & Features

| Page | URL | Key Features |
| :--- | :--- | :--- |
| **Customer Storefront** | [index.html](file:///c:/Users/vikas/OneDrive/Desktop/GharDoot/index.html) | Mobile PWA, Android & iOS install section, mobile bottom navigation, interactive location trigger pill, official logo, 24+ village essentials, live search, Hindi/English toggle, Web Audio sound effects, Quick View modal, Testimonials, FAQ accordion, slide-over cart, COD/UPI checkout. |
| **Login & Auth Hub** | [login.html](file:///c:/Users/vikas/OneDrive/Desktop/GharDoot/login.html) | Multi-role authentication (Customer, Shopkeeper, Delivery Hero with Mobile OTP; Admin with Email/Mobile/Username + Password & Set Password). |
| **Platform Admin Console** | [admin-dashboard.html](file:///c:/Users/vikas/OneDrive/Desktop/GharDoot/admin-dashboard.html) | Village cluster operations, merchant verification queue, fleet dispatch monitor, and live "Admin Security & Password" management panel. |
| **Live Order Tracking** | [track-order.html](file:///c:/Users/vikas/OneDrive/Desktop/GharDoot/track-order.html) | Real-time delivery progress bar, animated route map, assigned GharDoot hero details, 4-digit verification OTP, driver call button. |
| **Customer Dashboard** | [customer-dashboard.html](file:///c:/Users/vikas/OneDrive/Desktop/GharDoot/customer-dashboard.html) | Active orders stepper, 1-click reorder from past orders, active delivery location with GPS detect and manual change buttons. |
| **Shop Details Page** | [shop-detail.html](file:///c:/Users/vikas/OneDrive/Desktop/GharDoot/shop-detail.html) | View specific village Kirana merchant, store history, ratings, and shop-specific inventory. |
| **Kirana Merchant Portal** | [shopkeeper-dashboard.html](file:///c:/Users/vikas/OneDrive/Desktop/GharDoot/shopkeeper-dashboard.html) | Incoming order packing alerts, 1-click pack & ready, inventory stock toggle, daily earnings and bank settlement ledger. |
| **Delivery Partner (Doot) Hub** | [delivery-dashboard.html](file:///c:/Users/vikas/OneDrive/Desktop/GharDoot/delivery-dashboard.html) | Online/Offline toggle, active delivery task with shop pickup and customer destination, cash collection, daily gig earnings. |
| **About GharDoot** | [about.html](file:///c:/Users/vikas/OneDrive/Desktop/GharDoot/about.html) | Our mission, rural hyperlocal model vs urban dark-stores comparison table, community impact stats. |
| **Partner With Us** | [partner-with-us.html](file:///c:/Users/vikas/OneDrive/Desktop/GharDoot/partner-with-us.html) | Dual registration forms (Village Kirana / Delivery Hero), interactive earnings calculator, partner benefits. |
| **Brand Identity Guide** | [brand-identity.html](file:///c:/Users/vikas/OneDrive/Desktop/GharDoot/brand-identity.html) | Interactive brand manual with color swatch codes, logo anatomy, clear space rules, and downloadable SVG/JPG assets. |

---

## 🌐 How to Test on Mobile Devices

- **On Android:** Open [index.html](file:///c:/Users/vikas/OneDrive/Desktop/GharDoot/index.html) in Google Chrome &rarr; Tap the **"🤖 Install on Android"** button or Chrome menu (⋮) &rarr; Tap **"Install app"**.
- **On Apple iPhone/iPad:** Open in Safari &rarr; Tap the **"🍎 Available For Apple iOS"** button or tap Safari Share icon (`⎋`) &rarr; Tap **"Add to Home Screen"** (`➕`).
