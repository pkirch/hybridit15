# Settings
$subscriptionName = "Azure Pass" # Get-AzureSubscription
$location = "West Europe" # Get-AzureLocation
$serviceName = "bbdemocamp1433"
$storageAccountName = "bbdemopk1433"
$storageContainerName = "vhds"
$adminUsername = "adm_demo"
$adminPassword = "Azure ist toll!"
$imageFamily = "Windows Server 2012 R2 Datacenter"
$vmName = "host1"
$instanceSize = "Basic_A1" # Get-AzureRoleSize

# In case you have more than one Azure subscription, select one.
Select-AzureSubscription -SubscriptionName $subscriptionName

# Get latest image for defined image family.
$imageName = Get-AzureVMImage | 
                Where-Object -Property ImageFamily -eq $imageFamily | 
                Sort-Object -Property PublishedDate -Descending | 
                Select-Object -ExpandProperty ImageName -First 1

# Create cloud service.
New-AzureService -Location $location -ServiceName $serviceName

# Create storage account.
New-AzureStorageAccount -Location $location -StorageAccountName $storageAccountName -Type Standard_LRS

# Create container for VHDs.
$storageAccountKey = Get-AzureStorageKey -StorageAccountName $storageAccountName
$storageContext = New-AzureStorageContext -StorageAccountKey $storageAccountKey.Primary -StorageAccountName $storageAccountKey.StorageAccountName
New-AzureStorageContainer -Name $storageContainerName -Permission Off -Context $storageContext

# Set current storage account.
Set-AzureSubscription -SubscriptionName $subscriptionName -CurrentStorageAccountName $storageAccountName

# Create new VM configuration.
$vmConfig = New-AzureVMConfig -ImageName $imageName -InstanceSize $instanceSize -Name $vmName -MediaLocation "https://$storageAccountName.blob.core.windows.net/$storageContainerName/$vmName.vhd"

# Add provisioning data to VM configuration.
Add-AzureProvisioningConfig -Windows -AdminUsername $adminUsername -Password $adminPassword -VM $vmConfig

# Create new VM and let it start.
New-AzureVM -ServiceName $serviceName -Location $location -VMs $vmConfig