
## Get Api Key

- login using google:  [https://tge.spheron.network/missions](https://tge.spheron.network/missions)
- Open console in browser, right click inspect -> choose Console on tab, then paste code below -> Enter:
```bash
const request = indexedDB.open("firebaseLocalStorageDb");

request.onsuccess = function(event) {
  const db = event.target.result
  const transaction = db.transaction(["firebaseLocalStorage"], "readonly")
  const store = transaction.objectStore("firebaseLocalStorage")
  const getAll = store.getAll()

  getAll.onsuccess = function() {
    const results = getAll.result
    results.forEach(entry => {
      console.log(entry.value.apiKey)
    })
  }
}
```

Copy the output then save in .env file
```bash
APIKEY_FIREBASE=YOUR_APIKEY_HERE
```


## Get refresh token

- Still in console browser, paste code below -> Enter:
```bash
const request = indexedDB.open("firebaseLocalStorageDb");

request.onsuccess = function(event) {
  const db = event.target.result
  const transaction = db.transaction(["firebaseLocalStorage"], "readonly")
  const store = transaction.objectStore("firebaseLocalStorage")
  const getAll = store.getAll()

  getAll.onsuccess = function() {
    const results = getAll.result
    results.forEach(entry => {
      console.log(entry.value.stsTokenManager.refreshToken)
    })
  }
}
```
Copy the output then save in .env file
```bash
REFRESH_FIREBASE=YOUR_APIKEY_HERE
```


## [ OPTIONAL ] Set up proxy

You can skip this proxy_url key in .env, Just add
```bash
PROXY_URL=""
```
however if you wanna setting up the proxy_url, you can add as below:
```bash
PROXY_URL=http://username:password@ip:port
```

⚠️ **note** 
Change username:password@ip:port using your real proxy. don't have? you can get [here](https://www.webshare.io/?referral_code=nk30zy0tpl37)


## Docker

Install docker in your computer, ⚠️ **note** you can skip if already installed:
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
read docs for detail [here](https://docs.docker.com/engine/install/ubuntu/)

check docker version:
```bash
docker --version
```

Pull the image
```bash
docker pull 
```

Run container
```
docker run -d --name spheron-spin 