# Modul 1 - Einführung in Azure
## Theorie
* Cloud (IaaS, PaaS, SaaS)
* Dienstübersicht
* Regionsübersicht
* Azure Ressource Manager (ARM)
* Beispielumgebung

Präsentation verfügbar auf GitHub und Docs.

## Demo
1. Verwaltungsportale vorstellen
2. Deployment aus Gallerien durchführen
3. Mit ARM Beispielumgebung erstellen

## Hands-On
### Ü1: Am Portal anmelden und umschauen

*Fakultativ. Empfohlen.  
Empfohlener Zeitaufwand ca. 5 min.*

Adressen: http://manage.windowsazure.com oder http://portal.azure.com

Die Verwaltungsportale von Azure öffnen und mit der Navigation vertraut machen.

### Ü2: ARM-Template deployen
*Obligatorisch.  
Geschätzter Zeitaufwand ca. 5 - 10 min.*

Diese Beispielumgebung kann für spätere Übungen verwendet werden. Z.B.
* Azure Backup
* Azure Automation 
* Azure Application Gateway

Das ARM-Template hat folgende Parameter:
* Name des Speicherkontos
* DNS-Adresse für die Beispielumgebung
* Benutzername und Passwort des Administratorkontos der VMs

Im ersten Schritt des Deployments mittels ARM-Template kann das Template angesehen und bearbeitet werden.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fpkirch%2Fhybridit15%2Fmaster%2FModul1%2Fdemoenv.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fpkirch%2Fhybridit15%2Fmaster%2FModul1%2Fdemoenv.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

Das Deployment kann einige Zeit in Anspruch nehmen. Für diese Übung warten wir nicht auf 
die Fertigstellung.

### Ü3: Extra-Übung: Manuelle Erstellung von Ressourcen in beiden Portalen
*Fakultativ. Empfohlen.
Empfohlener Zeitaufwand ca. 5 - 10 min.*

Erfahren, wie sich beide Portale in Verwendung und Funktionalität unterscheiden.  
Die VMs können als Test- oder Arbeits-VMs für die interaktive Arbeit verwendet werden.

Für beide VMs wird empfohlen als Vorlage "Windows Server 2012 R2" auszuwählen.

1. Eine VM über das aktuelle Portal erstellen.
2. Eine VM über das Vorschau-Portal erstellen.  

**Bemerkenswerte Punkte:**
* Welche VMs sind aus welchem Portal heraus sichtbar?
* Welche Ressourcen wurden im Zuge der VM-Erstellung ebenfalls erstellt?

### Ü4: Extra-Übung: Classic VM per PowerShell (ASM)
*Fakultativ. 
Empfohlener Zeitaufwand ca. 5 - 10 min.*

Diese Übung benötigt PowerShell für Azure. (Ist auf den Teilnehmer-Laptops vorinstalliert.)

1. [Bereitgestelltes Skript](https://raw.githubusercontent.com/pkirch/hybridit15/master/Modul1/Create-AzureVM.ps1) herunterladen und studieren.
2. Individuelle Einstellungen im Skript anpassen und ausführen.
3. Nach einigen Minuten ist die VM erstellt.

## Weiterführende Informationen

[Download PowerShell für Microsoft Azure](https://azure.microsoft.com/de-de/downloads/)

[Referenz Microsoft Azure](https://msdn.microsoft.com/en-us/library/azure/mt420159.aspx)  

[Azure Resource Manager REST API Reference](https://msdn.microsoft.com/en-us/library/azure/dn790568.aspx)  
[Erstellen von Azure-Ressourcen-Manager-Vorlagen](https://azure.microsoft.com/de-de/documentation/articles/resource-group-authoring-templates/)

## Abkürzungen

AAD: Azure Active Directory  
ASM: Azure Service Management  
P2S: Point-to-Site  
VNet: Virtuelles Netzwerk