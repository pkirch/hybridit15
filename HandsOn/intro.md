# Übungen - Verwaltung von Ressourcen
## Themen
* Cloud (IaaS, PaaS, SaaS)
* Dienstübersicht
* Regionsübersicht
* Azure Ressource Manager (ARM)
* Beispielumgebung

## Ü1: Am Portal anmelden und umschauen
Empfohlener Zeitaufwand ca. 10 min.

Altes Portal: https://manage.windowsazure.com 
Neues Portal: https://portal.azure.com

Die Verwaltungsportale von Azure öffnen und mit der Navigation vertraut machen.

## Ü2: Übung: Manuelle Erstellung von Ressourcen in beiden Portalen
Zeitaufwand ca. 10 - 15 min.

Erfahren, wie sich beide Portale in Verwendung und Funktionalität unterscheiden.  
Die VMs können als Test- oder Arbeits-VMs für die interaktive Arbeit verwendet werden.

Für beide VMs wird empfohlen als Vorlage "Windows Server 2012 R2" auszuwählen.

1. Eine VM über das aktuelle Portal erstellen.
2. Eine VM über das Vorschau-Portal erstellen.  

**Bemerkenswerte Punkte:**
* Welche VMs sind aus welchem Portal heraus sichtbar?
* Welche Ressourcen wurden im Zuge der VM-Erstellung ebenfalls erstellt?

## Ü3: Extra-Übung: Classic VM per PowerShell (ASM)
Zeitaufwand ca. 5 - 10 min.

Diese Übung benötigt PowerShell für Azure und Azure Subscriptions müssen bereits konfiguriert sein. 
PowerShell für Azure ist auf den Teilnehmer-Laptops vorinstalliert. 
Azure Subscriptions fügen Sie mit dem PowerShell-Befehl *Add-AzureAccount* hinzu.

1. [Bereitgestelltes Skript](https://raw.githubusercontent.com/pkirch/hybridit15/master/Modul1/Create-AzureVM.ps1) herunterladen und studieren.
2. Individuelle Einstellungen im Skript anpassen und ausführen.
    * Der Subscription-Name muss dem Ihrer Subscription entsprechen. (Zu Ermitteln mit dem PowerShell-Befehl Get-AzureSubscription.)
    * Die Namen für den Cloud Service und das Speicherkonto müssen global eindeutig sein.
3. Nach einigen Minuten ist die VM erstellt.

## Weiterführende Informationen

[Download PowerShell für Microsoft Azure](https://azure.microsoft.com/de-de/downloads/)

[Referenz Microsoft Azure](https://msdn.microsoft.com/en-us/library/azure/mt420159.aspx)  

[Azure Resource Manager REST API Reference](https://msdn.microsoft.com/en-us/library/azure/dn790568.aspx)  
[Erstellen von Azure-Ressourcen-Manager-Vorlagen](https://azure.microsoft.com/de-de/documentation/articles/resource-group-authoring-templates/)

[Azure Quickstart Templates](https://github.com/Azure/azure-quickstart-templates)

## Abkürzungen

AAD: Azure Active Directory  
ASM: Azure Service Management  
P2S: Point-to-Site  
VNet: Virtuelles Netzwerk