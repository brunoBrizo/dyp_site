function loadMain() {
  var script = document.createElement('script');
  script.src = "main.dart.js";
  document.body.appendChild(script);
}

if ('serviceWorker' in navigator) {
  window.addEventListener('DOMContentLoaded', function () {
    navigator.serviceWorker.register('flutter_service_worker.js')
      .then(function (serviceWorkerRegistration) {
        if (serviceWorkerRegistration.installing == null) {
          loadMain();
        } else {
          serviceWorkerRegistration.onupdatefound = function () {
            var newServiceWorker = serviceWorkerRegistration.installing;
            newServiceWorker.onstatechange = function () {
              if (newServiceWorker.state === 'installed') {
                newServiceWorker.postMessage('skipWaiting');
              } else if (newServiceWorker.state === 'activated') {
                loadMain();
              }
            }
          }
        }
      }).catch(function (error) {
        loadMain();
      });
  });
} else {
  loadMain();
}