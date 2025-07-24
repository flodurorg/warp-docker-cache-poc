variable "CACHE" {
  default = "type=gha,url=http://127.0.0.1:49160/,version=1"
}

group "default" {
  targets = ["node", "chrome", "firefox"]
}

target "base" {
  context    = "."
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
}

target "node" {
  inherits = ["base"]
  tags     = ["downloader:node"]
  args = {
    PACKAGE_URL = "https://nodejs.org/dist/v20.11.1/node-v20.11.1-linux-x64.tar.gz"
  }
  cache-from = ["${CACHE},scope=node"]
  cache-to   = ["${CACHE},scope=node"]
}

target "chrome" {
  inherits = ["base"]
  tags     = ["downloader:chrome"]
  args = {
    PACKAGE_URL = "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
  }
  cache-from = ["${CACHE},scope=chrome"]
  cache-to   = ["${CACHE},scope=chrome"]
}

target "firefox" {
  inherits = ["base"]
  tags     = ["downloader:firefox"]
  args = {
    PACKAGE_URL = "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"
  }
  cache-from = ["${CACHE},scope=firefox"]
  cache-to   = ["${CACHE},scope=firefox"]
}
