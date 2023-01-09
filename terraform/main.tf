terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_resourcemanager_folder" "live_debug" {
  name = "live-debug"
}

output "stub_url" {
  value = "https://${yandex_api_gateway.stub.domain}"
}

output "ws_url" {
  value = "wss://${yandex_api_gateway.stub.domain}/ws"
}

output "stub_id" {
  value = yandex_function.stub.id
}


# module "bridge" {
#   source = "./bridge"
#   folder_id = yandex_resourcemanager_folder.live_debug.id
#   sa_id = yandex_iam_service_account.live_debug.id
# }

# module "stub" {
#   source = "./stub"
#   folder_id = yandex_resourcemanager_folder.live_debug.id
#   sa_id = yandex_iam_service_account.live_debug.id
#   # bridge_ws_url = module.bridge.ws_url
# }

# output "stub_url" {
#   value = module.stub.stub_url
# }

# output "stub_id" {
#   value = module.stub.stub_fn_id
# }

# output "brigde_ws_url" {
#   value = module.bridge.ws_url
# }

# output "brigde_status_url" {
#   value = module.bridge.status_url
# }
