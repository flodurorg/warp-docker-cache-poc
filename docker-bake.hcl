variable "CACHE" {
  default = "type=gha,url=http://127.0.0.1:49160/,version=1"
}

group "default" {
  targets = [
    "long-target-name-node",
    "long-target-name-chrome",
    "long-target-name-firefox",
    "long-target-name-python",
    "long-target-name-golang",
    "long-target-name-vscode"
  ]
}

target "base" {
  context    = "."
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  cache-from = ["${CACHE},scope=common-cache"]
  cache-to   = ["${CACHE},scope=common-cache"]
}

target "long-target-name-node" {
  inherits = ["base"]
  tags     = ["downloader:node"]
  args = {
    PACKAGE_URL = "https://nodejs.org/dist/v20.11.1/node-v20.11.1-linux-x64.tar.gz"
  }
  cache-from = ["${CACHE},scope=my-test-scope-long-name-node"]
  cache-to   = ["${CACHE},scope=my-test-scope-long-name-node"]
}

target "long-target-name-chrome" {
  inherits = ["base"]
  tags     = ["downloader:chrome"]
  args = {
    PACKAGE_URL = "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
  }
  cache-from = ["${CACHE},scope=my-test-scope-long-name-chrome"]
  cache-to   = ["${CACHE},scope=my-test-scope-long-name-chrome"]
}

target "long-target-name-firefox" {
  inherits = ["base"]
  tags     = ["downloader:firefox"]
  args = {
    PACKAGE_URL = "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"
  }
  cache-from = ["${CACHE},scope=my-test-scope-long-name-firefox"]
  cache-to   = ["${CACHE},scope=my-test-scope-long-name-firefox"]
}

target "long-target-name-python" {
  inherits = ["base"]
  tags     = ["downloader:python"]
  args = {
    PACKAGE_URL = "https://www.python.org/ftp/python/3.12.2/Python-3.12.2.tgz"
  }
  cache-from = ["${CACHE},scope=my-test-scope-long-name-python"]
  cache-to   = ["${CACHE},scope=my-test-scope-long-name-python"]
}

target "long-target-name-golang" {
  inherits = ["base"]
  tags     = ["downloader:golang"]
  args = {
    PACKAGE_URL = "https://go.dev/dl/go1.22.0.linux-amd64.tar.gz"
  }
  cache-from = ["${CACHE},scope=my-test-scope-long-name-golang"]
  cache-to   = ["${CACHE},scope=my-test-scope-long-name-golang"]
}

target "long-target-name-vscode" {
  inherits = ["base"]
  tags     = ["downloader:vscode"]
  args = {
    PACKAGE_URL = "https://update.code.visualstudio.com/latest/linux-deb-x64/stable"
  }
  cache-from = ["${CACHE},scope=my-test-scope-long-name-vscode"]
  cache-to   = ["${CACHE},scope=my-test-scope-long-name-vscode"]
}
