terraform {
  cloud {
    organization = "rtm-demo-lab"

    workspaces {
      name = "terra-house"
    }
  }
}