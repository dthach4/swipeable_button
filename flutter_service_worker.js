'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "98ce46ac722784d33bdb84863045be6b",
"/": "98ce46ac722784d33bdb84863045be6b",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/NOTICES": "31e53fb3e26ef7f9a9a58aa9278c5e5f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"manifest.json": "56acf31e59e5d19611c22841d9b4c5de",
".git/config": "f4df08d2f5bf06ab1514d05a02ea1175",
".git/COMMIT_EDITMSG": "502d3cc8858d7686a673300c8fc71941",
".git/hooks/pre-push.sample": "3c5989301dd4b949dfa1f43738a22819",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/update.sample": "517f14b9239689dff8bda3022ebd9004",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-commit.sample": "e4db8c12ee125a8a085907b757359ef0",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "db4d62db2039e4bec38baa7567788284",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/logs/HEAD": "1a6d13679deb8100c1138953358d2a93",
".git/logs/refs/heads/gh-pages": "1a6d13679deb8100c1138953358d2a93",
".git/logs/refs/remotes/origin/HEAD": "64465f13c4e5926488123e95a5be4ede",
".git/logs/refs/remotes/origin/gh-pages": "a53f65f886fcc5d10fd01db3b5ddca22",
".git/index": "f67d1addb63cd220e82557d99fb3fb39",
".git/packed-refs": "2008742229cfbf57cc517d8b55fc3889",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/objects/3f/e13529d90b979c073fde7aa086b1e69368e342": "34485fb8d620edc177e4551b1e145bb3",
".git/objects/7d/0f2dea442caf1e77e625272f9de8a58a9d4f95": "6c61f4080242cf5bc79abc7c94a1d396",
".git/objects/31/135f36bdc11be15b8707c8321eb1cac5bbdabd": "1b676db09df1b82d5411f5f7ede175ad",
".git/objects/pack/pack-adc479e857d3b0a319303644aefdd492d3f1c704.idx": "f806f79ff9060a91a36224ebc5cd55d5",
".git/objects/pack/pack-adc479e857d3b0a319303644aefdd492d3f1c704.pack": "73709be54bb3a3f761a73d048c5e177b",
".git/objects/12/1d3bdb1959efcee4d41462a3131beb748c047c": "f2a838e5add6fdac09eb3a00463c3a33",
".git/objects/65/e8ddd740760a855e5f41310a68c039016159c7": "ba217bc4580d55f63cc6b235a48e282c",
".git/objects/ce/c87c59e3a1a26b83ad2270c7134a0bf13e929b": "bd5b22444b5942ae7e4523ec21862aa3",
".git/objects/f4/93432ab6a66000401fdce565b5f5ef46bcc887": "c29fb56c24b6c3586f05948dada0fb73",
".git/objects/5c/ecba5dc2ca5a4e3daf3526883b8a7a0fb83c09": "c17ff12f0f7f823612328fa5936d366a",
".git/objects/5d/dd05e48f39d2ba67e2077fb3ac06d3338e150f": "71da562a958fa25c7f4fe26c5d7f518c",
".git/objects/42/a6b5b9db070288837acc3062ba273b86accd52": "bf2c3d35d9cfb31e7257b3abc34f9193",
".git/objects/db/5e6541742003e33e2012ea72ad3ffab5ce37f2": "1b0819ebefd617232390e514c35c975c",
".git/objects/0c/ee197eb77687cd5deda13183878d67ffce2306": "1f858acc692e48e2526f081d007ecdd6",
".git/objects/8d/08044f9c2ca793a71b13adb5b0098fd31a5a3e": "be705cbbf467f3b098d415e3265e5047",
".git/refs/heads/gh-pages": "2c3490895fde678fb8f82adac3806d58",
".git/refs/remotes/origin/HEAD": "98b16e0b650190870f1b40bc8f4aec4e",
".git/refs/remotes/origin/gh-pages": "2c3490895fde678fb8f82adac3806d58",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
"version.json": "b468d96f649730fabcfbbff184e522db",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "28b536763d71790a5211c2430de8669c"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
