resource "azurerm_storage_account" "brief23max_stg_acc" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create Azure File Share
resource "azurerm_storage_share" "brief23max_fileshare" {
  name                 = var.file_share_name
  storage_account_name = azurerm_storage_account.brief23max_stg_acc.name
  quota                = 100
}

locals {
  upload_path = "C:\\\\Users\\MaximeVanpeene\\OneDrive - WAKERS\\Documents\\Simplon\\Brief23 - commundevia\\Emotions_Tracking_App_NLP\\emotiontracking"
  command = "az storage file upload-batch -s \"${local.upload_path}\" --destination ${azurerm_storage_share.brief23max_fileshare.name} --account-name ${azurerm_storage_account.brief23max_stg_acc.name}"
}


resource "null_resource" "upload" {
  depends_on = [
    azurerm_storage_share.brief23max_fileshare
  ]
  provisioner "local-exec" {
    interpreter = ["PowerShell", "-Command"]
    command = <<-EOT
      $process = Start-Process 'az' -ArgumentList 'storage file upload-batch -s "${local.upload_path}" --destination ${azurerm_storage_share.brief23max_fileshare.name} --account-name ${azurerm_storage_account.brief23max_stg_acc.name}' -PassThru -NoNewWindow
      $process.WaitForExit(1800000)  # Timeout after 1,800,000 ms or 30 minutes
      if (-not $process.HasExited) {
        $process.Kill()
        Write-Host "Process killed due to timeout"
      }
    EOT
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

