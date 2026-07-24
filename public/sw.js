// Minimális service worker — a Chrome telepíthetőségi feltételeihez kell egy
// regisztrált service worker, ami kezeli a 'fetch' eseményt. Nem csinál egyedi
// offline gyorsítótárazást, egyszerűen továbbengedi a hálózati kéréseket.

self.addEventListener("install", () => {
  self.skipWaiting();
});

self.addEventListener("activate", (event) => {
  event.waitUntil(self.clients.claim());
});

self.addEventListener("fetch", (event) => {
  event.respondWith(fetch(event.request));
});
