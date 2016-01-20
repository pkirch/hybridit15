# Modul 4 - Hybride Automatisierung & Verwaltung
## Themen
* Einführung in die Operations Management Suite
* Einführung in Azure Automation

## Demo

1. Konto für Azure Automation erstellen  
2. Hybrid Worker installieren  
3. Skript auf Hybrid Worker ausführen  

## Hands-On

### Ü1: Azure Automation-Konto erstellen
Zeitaufwand ca. 5 min.

Wichtig: Das Azure Automation-Konto über das neue Verwaltungsportal (https://portal.azure.com) erstellen, 
damit neue Funktionen wie graphische Skripte und Hybrid Worker zur Verfügung stehen.

Die Einstellungen können Sie frei wählen. Als Ressourcengruppe ist es empfehlenswert, eine neue Gruppe zu erstellen. 
Der folgende Screenshot zeigt Ihnen den Weg zu einem neuen Azure Automation-Konto und mögliche Einstellungen.

<img src="../images/create_automation_account.png">

### Ü2: Hybrid Worker installieren und registrieren
Zeitaufwand ca. 20 min.  
Diese Übung setzt voraus, dass Sie bereits ein Automation-Konto (Übung 1) erstellt haben.

Installation und Registrierung des Hybrid Worker auf einer beliebigen Windows-VM.

Folgende Arbeitsschritte müssen hier abgearbeitet werden.

#### 1. Erstellen Sie einen Operations Management Suite-Arbeitsbereich (über das [aktuelle Portal](https://manage.windowsazure.com/))   

<img src="../images/create_operational_insights_account.png">

#### 2. Dem OMS-Arbeitsbereich die Lösung "Automation" hinzufügen

<img src="../images/oms_add_solutions_tile.png">
<img src="../images/oms_add_automation_solution.png">

Danach benötigt diese Solution noch Konfigurationsdaten.

<img src="../images/oms_automation_solution_needs_configuration.png">
<img src="../images/oms_automation_solution_configuration.png">

#### 3. Microsoft Management Agent auf einer Windows-VM installieren.

Laden Sie den Windows Agent (64 bit) auf der VM herunter, auf der der Agent installiert werden soll. 
([Screenshot](../images/oms_download_agent.png))

Entweder Sie öffnen das OMS-Portal auch auf der VM oder Sie kopieren sich den folgenden Link: https://go.microsoft.com/fwlink/?LinkID=517476.  
Vergessen Sie nicht, auf der Windows Server-VM die 
[erweiterte Sicherheit vom Internet Explorer abzuschalten](../images/deactivate_hard_admin.png), um Downloads durchführen zu können.

#### 4. Runbook-Umgebung installieren und mit Azure Automation verbinden

Öffnen Sie eine PowerShell-Session und führen Sie die folgenden Zeilen dort aus. Falls der Pfad nicht gefunden wird, kann dies zwei Gründe haben:  
1. Die Daten der Solution "AzureAutomation" wurden noch nicht heruntergeladen. Dies kann zwei, drei Minuten dauern.
2. Die Version hat sich geändert. Schauen Sie im Verzeichnis AzureAutomation nach der Version.

Die Endpunkt-URL und Token finden Sie in den [Schlüssel-Details Ihres Automation-Kontos](../images/automation_account_credentials.png).

cd "C:\Program Files\Microsoft Monitoring Agent\Agent\AzureAutomation\7.2.7150.0\HybridRegistration"  
Import-Module ./HybridRegistration.psd1

Add-HybridRunbookWorker -Name "ITCamp" -EndPoint "Url" -Token "String"

### Ü3: Skript auf Hybrid Worker ausführen
Zeitaufwand ca. 10 min.  
Diese Übung setzt voraus, dass Sie bereits einen Hybrid Worker (Übung 2) registriert haben.

Erstellen Sie ein Runbook, das auf einem Windows Server ausgeführt werden kann, welches dann 
auf den in Übung 2 konfigurierten Hybrid Worker ausgeführt wird.

Ein sehr einfaches und kurzes Beispiel für ein solches Skript wäre der einzelne Befehl *Get-Process*. 
Rückgabewerte sind dann die aktuelle laufenden Prozesse auf dem Server.

### Ü4: Extra-Übung: Automatisierungsskript für Azure erstellen
Zeitaufwand ca. 10 - 20 min.  
Diese Übung setzt voraus, dass Sie bereits ein Automation-Konto (Übung 1) erstellt haben und dass Sie im Modul 2 ein Test-Benutzerkonto angelegt haben.

Sie haben die freie Wahl, ob Sie ein Skript per graphischen Editor oder im Texteditor erstellen.

In dieser Übung können Sie bei entsprechenden PowerShell-Vorkenntnissen gerne eigene Skripte erstellen oder 
Skripte aus der Vorlagengallerie verwenden.

Bei einem neuen Automation-Konto kann ein Beispiel-Runbook *Get-AzureVMTutorial* erstellt werden. 
Dieses Runbook benötigt in den Assets ein Credential eines AAD-Benutzers, der Berechtigungen hat, 
auf die Subscription zuzugreifen (z.B. Co-Admin). 

## Weiterführende Informationen

[Azure Automation Übersicht](https://azure.microsoft.com/de-de/services/automation/)  
[Azure Automation Dokumentation](https://azure.microsoft.com/de-de/documentation/services/automation/)  
[Azure Automation Preise](https://azure.microsoft.com/de-de/pricing/details/automation/)

[Azure Automation Hybrid Runbook Workers](https://azure.microsoft.com/de-de/documentation/articles/automation-hybrid-runbook-worker/)

[Operation Management Suite Startseite](http://www.microsoft.com/oms/)  
[Operation Managment Suite Preise](https://www.microsoft.com/de-de/server-cloud/operations-management-suite/pricing.aspx)

[Operational Insights Übersicht](https://azure.microsoft.com/de-de/services/operational-insights/)  
[Operational Insights Dokumentation](https://azure.microsoft.com/de-de/documentation/services/operational-insights/)  
[Operational Insights Preise](https://azure.microsoft.com/de-de/pricing/details/operational-insights/)
