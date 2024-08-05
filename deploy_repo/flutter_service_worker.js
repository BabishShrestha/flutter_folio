'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "79fe6248fdb0e569f7d37756e6b271b6",
"assets/assets/images/label.png": "cb2466dc93bade1b336e85943dda4dcd",
"assets/assets/images/logo/icon.png": "7eb475c7cbd75bdb91b9da52e0396baa",
"assets/assets/images/logo/social_media/instagram.png": "438b311df98f9c067e9381b0cd3818e7",
"assets/assets/images/logo/social_media/facebook_white.png": "1987384e018363e8afa3eefdcab84652",
"assets/assets/images/logo/social_media/facebook.png": "46d56ffc0c3c2614f74baf2cb1409958",
"assets/assets/images/logo/social_media/instagram_white.png": "b68ac4f96a44edcd2cd2d2c8af714553",
"assets/assets/images/logo/social_media/linkedin_white.png": "cbe4a788a9d51714a85a2d19dcb7e7af",
"assets/assets/images/logo/social_media/linkedin.png": "e9c6040199934e91b3fb1de19337f5e3",
"assets/assets/images/logo/programming/unity-small.png": "874368f74c850e8743ac849dc61a4f0b",
"assets/assets/images/logo/programming/vscode.png": "9ff903ed3263b8082ddd16a0da707676",
"assets/assets/images/logo/programming/github.png": "52285da8f0da8d45412eff6d50340f05",
"assets/assets/images/logo/programming/dart.webp": "60fbd31aec7b4a720354e75682f53901",
"assets/assets/images/logo/programming/firebase.png": "8d323d78ace716ca5fd3ee0b4dba5642",
"assets/assets/images/logo/programming/dart.png": "47dd1d461624029d421f9aca8555f7ce",
"assets/assets/images/logo/programming/jira.png": "fb6f8d0884ee7b21b68f772a032b4e3f",
"assets/assets/images/logo/programming/csharp.png": "a5d410913fa1f75c50192d2ad4c53334",
"assets/assets/images/logo/programming/unity-white.png": "5f098c4d6b9bbc86e660854c0112169d",
"assets/assets/images/logo/programming/unity.png": "c31e07285df076254c55fff2057f492b",
"assets/assets/images/logo/programming/git.png": "e1df9df35cf82ddefa79b79de4189839",
"assets/assets/images/logo/programming/sql.png": "592d1de89469c925efe3ab247bfdb13f",
"assets/assets/images/logo/programming/postman.png": "d51b50cf7b94a418b23bd06c1151fc35",
"assets/assets/images/logo/programming/flutter.png": "2aaf8f7045948a1557e0f7751f156e93",
"assets/assets/images/logo/project_apps/fms.png": "b04ffd914aad990405d258afefa50748",
"assets/assets/images/logo/project_apps/gokyo.png": "5c3a381e7897ba8c4fabdfb5467efda6",
"assets/assets/images/logo/project_apps/sortYourBin.png": "3bf3c7e8673809e9c1751981c78ca0cf",
"assets/assets/images/logo/project_apps/solitaire.png": "1974cddd9858405664d142207ca29fb4",
"assets/assets/images/logo/project_apps/eventsmo.png": "23f6142413aa447f5e014c4e4f3b6e56",
"assets/assets/images/logo/project_apps/dcms.png": "06897832f8396916c7ec6389e7368271",
"assets/assets/images/logo/project_apps/agentX.png": "c364076bd4efc6a3acc19c810988562d",
"assets/assets/images/logo/project_apps/eventsmoHost.png": "ebdcedce28a33926235c5ea654624183",
"assets/assets/images/red_dot.png": "f651fe9e8a27879dc54baa6b6184338c",
"assets/assets/images/about.png": "cddb3b4135eb25e8cc1709f6dccb97b1",
"assets/assets/images/screenshots/sortyourbin_sc4.jpg": "ab9d0d6a1a7a3778ae88b843e2d23054",
"assets/assets/images/screenshots/sortyourbinsc_5.jpg": "b7bce0c29fb232842f54094b75cb01bf",
"assets/assets/images/screenshots/sortyourbin_sc1.jpg": "538bfca3046988417c1395281179866c",
"assets/assets/images/screenshots/sortyourbin_sc2.jpg": "6d86318b4404753c7da6b67887b2f529",
"assets/assets/images/screenshots/sortyourbin_sc3.jpg": "cf48131721e169d15be85aa5fdaaaa16",
"assets/assets/images/avatar2.png": "4067577e9e11393304f5d22d95307397",
"assets/assets/images/avatar3.png": "16da0df38c7bf67b16371961bc975d62",
"assets/assets/images/contact.png": "29e349adbb8cd0faf5a5799cfbb65932",
"assets/assets/images/avatar6.png": "6051436d6a4439267d3a84eb995b1698",
"assets/assets/images/avatar.png": "6766894a4b17ef231f6613ba72802095",
"assets/assets/images/avatar5.png": "72431aa6ad1f59827f9bf2fd67035b7f",
"assets/assets/images/flat-lay-blue-monday-concept-with-copy-space.jpg": "2828771fb0e9cb2d5607ffe6586a51b1",
"assets/assets/images/avatar4.png": "71f583f9667e7bba5ac98d00dcb5063c",
"assets/assets/fonts/Poppins-SemiBoldItalic.ttf": "215bb268074bbf9212656b4a8d1fcc30",
"assets/assets/fonts/Poppins-Black.ttf": "9a3a3c0803219892727ed9d85ad5caea",
"assets/assets/fonts/Poppins-BlackItalic.ttf": "91aa7b4539f05576f6003d7da0d5fa1c",
"assets/assets/fonts/Poppins-ExtraLight.ttf": "a0f2eadb0002101ea5da28381ce16cde",
"assets/assets/fonts/Lato-Thin.ttf": "759b07d5b5750146d4836c331fc86509",
"assets/assets/fonts/Roboto-Medium.ttf": "68ea4734cf86bd544650aee05137d7bb",
"assets/assets/fonts/Roboto-Regular.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"assets/assets/fonts/Lato-BoldItalic.ttf": "a9f2260eb3593f4d1db7e604c3e4034a",
"assets/assets/fonts/Poppins-SemiBold.ttf": "0fc985df77c6b59d37e79b97ed7fb744",
"assets/assets/fonts/Lato-Italic.ttf": "ef6c5ef3b6f15eb2b8fbb205d5f7492b",
"assets/assets/fonts/Poppins-Light.ttf": "1bb10326b972c92be6c59c048a4327e4",
"assets/assets/fonts/Lato-Light.ttf": "a3ba535f79c84f435ff448876032a5f5",
"assets/assets/fonts/Lato-Bold.ttf": "26af1ab89ca07c82f244395a9849e150",
"assets/assets/fonts/Poppins-Medium.ttf": "614a91afc751f09d049231f828801c20",
"assets/assets/fonts/Poppins-LightItalic.ttf": "b35333e8e8fbf4546626db4717c97c72",
"assets/assets/fonts/Poppins-ExtraLightItalic.ttf": "4aa49ff8c7de4295787a4c7b318103e5",
"assets/assets/fonts/Lato-LightItalic.ttf": "b52271ff903c67b158f31f1cc72de5e6",
"assets/assets/fonts/Lato-ThinItalic.ttf": "e3371f470cda96aa948970bcbfeb9486",
"assets/assets/fonts/Poppins-BoldItalic.ttf": "ad298ba8cf26d9c214d28d1eef16fb4c",
"assets/assets/fonts/Poppins-Bold.ttf": "124cd57d8f41f6db22a724f882dca3f4",
"assets/assets/fonts/Lato-BlackItalic.ttf": "fbc559fe4afed1a54eb133a468c499fb",
"assets/assets/fonts/Zeyada-Regular.ttf": "ba6dd1f5d34075339dba06c690388c93",
"assets/assets/fonts/Lato-Black.ttf": "02627f85741ae2e44ba7af4d276834b9",
"assets/assets/fonts/Poppins-ExtraBoldItalic.ttf": "cacbed9f986d5685947088fec7da20af",
"assets/assets/fonts/Poppins-MediumItalic.ttf": "f34bf75e5fbde2ab10e87b35c5b115e2",
"assets/assets/fonts/Poppins-ThinItalic.ttf": "4fc5673b837f1ba41825221a88fc7eb2",
"assets/assets/fonts/Poppins-ExtraBold.ttf": "4252dae8574e434c7bb0127b8ffd06df",
"assets/assets/fonts/Poppins-Regular.ttf": "cd6b896a19b4babd1a2fa07498e9fc47",
"assets/assets/fonts/Lato-Regular.ttf": "c5c3b9b91ff2c85ab6dcf666f5d852b0",
"assets/assets/fonts/Poppins-Thin.ttf": "010bf26d1f08aa72a7993f1e50bc0a66",
"assets/assets/fonts/Poppins-Italic.ttf": "07502c4fe46025097dd8b1e331182ee0",
"assets/FontManifest.json": "8357469046ae91ae0aa71f25a518b0d7",
"assets/AssetManifest.bin.json": "7393e218bc842bdd6cb32f3066b68be4",
"assets/NOTICES": "ac0bd36cc4d94c01124dd1e37ec8ef25",
"assets/AssetManifest.bin": "a7a11bc4bd2aedb5a954888154d4485e",
"assets/AssetManifest.json": "16e643da2bd2cbe8902c66ec21507154",
"assets/fonts/MaterialIcons-Regular.otf": "622701883970956ace31605069eb395a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"index.html": "140a24941ec2aec3306453b1f51ce67a",
"/": "140a24941ec2aec3306453b1f51ce67a",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"icons/Icon-512.png": "9eb449906c6fb428ba1f4358eba231ab",
"icons/Icon-maskable-512.png": "9eb449906c6fb428ba1f4358eba231ab",
"icons/Icon-maskable-192.png": "1e411b49ba783c48154f1e31408ca61f",
"icons/Icon-192.png": "1e411b49ba783c48154f1e31408ca61f",
"favicon.png": "6ca1f8d1abb3212d319df5d5fc03126c",
"manifest.json": "27c2770c62dc0712097bc2c7401eaeeb",
"main.dart.js": "1e43bf06853c1e08a7eca94345b13d0c",
"version.json": "c77795558ac9d70b12da05587026febc"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
