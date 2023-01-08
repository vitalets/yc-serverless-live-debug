resource "yandex_iam_service_account" "live_debug" {
  name        = "live-debug-sa"
  description = "Service account to manage live debug"
  folder_id = yandex_resourcemanager_folder.live_debug.id
}

resource "yandex_resourcemanager_folder_iam_member" "role_functions_invoker" {
  folder_id = yandex_resourcemanager_folder.live_debug.id
  role      = "serverless.functions.invoker"
  member    = "serviceAccount:${yandex_iam_service_account.live_debug.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "role_ydb_editor" {
  folder_id = yandex_resourcemanager_folder.live_debug.id
  role      = "ydb.editor"
  member    = "serviceAccount:${yandex_iam_service_account.live_debug.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "role_apigw_ws_writer" {
  folder_id = yandex_resourcemanager_folder.live_debug.id
  role      = "api-gateway.websocketWriter"
  member    = "serviceAccount:${yandex_iam_service_account.live_debug.id}"
}
