/**
 * GharDoot - Service Worker for Mobile PWA (Android & Apple iOS)
 * Cache-first for static assets, network-first for live orders
 * Brand: GharDoot | Tagline: Har Zaroorat, Ghar Tak!
 */

const CACHE_NAME = 'ghardoot-v2.1';
const STATIC_ASSETS = [
  './',
  './index.html',
  './customer-dashboard.html',
  './shopkeeper-dashboard.html',
  './delivery-dashboard.html',
  './admin-dashboard.html',
  './login.html',
  './track-order.html',
  './shop-detail.html',
  './about.html',
  './partner-with-us.html',
  './brand-identity.html',
  './manifest.json',
  './assets/css/style.css',
  './assets/js/mock-data.js',
  './assets/js/location.js',
  './assets/js/auth.js',
  './assets/js/app.js',
  './assets/js/mobile.js',
  './assets/images/logo.jpg',
  './assets/images/logo.svg',
  './assets/images/logo-icon.svg',
  './assets/images/favicon.svg'
];

self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(STATIC_ASSETS);
    })
  );
  self.skipWaiting();
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((keys) => {
      return Promise.all(
        keys.filter((key) => key !== CACHE_NAME).map((key) => caches.delete(key))
      );
    })
  );
  self.clients.claim();
});

self.addEventListener('fetch', (event) => {
  // Only cache GET requests
  if (event.request.method !== 'GET') return;

  event.respondWith(
    caches.match(event.request).then((cachedResponse) => {
      if (cachedResponse) {
        // Return cached and update cache in background
        fetch(event.request).then((networkResponse) => {
          if (networkResponse && networkResponse.status === 200) {
            caches.open(CACHE_NAME).then((cache) => {
              cache.put(event.request, networkResponse.clone());
            });
          }
        }).catch(() => {});
        return cachedResponse;
      }

      return fetch(event.request).then((networkResponse) => {
        if (!networkResponse || networkResponse.status !== 200 || networkResponse.type !== 'basic') {
          return networkResponse;
        }
        const responseToCache = networkResponse.clone();
        caches.open(CACHE_NAME).then((cache) => {
          cache.put(event.request, responseToCache);
        });
        return networkResponse;
      }).catch(() => {
        // Offline fallback to index
        if (event.request.headers.get('accept').includes('text/html')) {
          return caches.match('./index.html');
        }
      });
    })
  );
});
