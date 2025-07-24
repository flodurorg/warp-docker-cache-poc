group "test" {
  targets = [
    "test-image"
  ]
}

variable "CACHE" {
  default = "type=gha,url=http://127.0.0.1:49160/,version=1,token="
}

target "test-image" {
  context    = "."
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  args = {
    PACKAGE_URL = "https://nodejs.org/dist/v20.11.1/node-v20.11.1-linux-x64.tar.gz"
  }
  cache-from = ["${CACHE},scope=test-image"]
  cache-to   = ["${CACHE},mode=max,scope=test-image"]
}
