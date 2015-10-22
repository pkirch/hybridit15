# Modul 5 - Desaster Recovery & Backups
## Themen
* Desaster Recovery
* Azure Backup

## Demo
* Desaster Recovery-Konfiguration vorstellen
* Azure Backup einrichten
	* Sicherung einer VM in Azure
	* Sicherung einer beliebigen Maschine

## Hands-On

Desaster Recovery kann derzeit leider nicht mit der simulierten On-Prem-Umgebung nachgestellt werden.

### Ü1: Vorbereitung: Azure Backup einrichten.
Zeitaufwand ca. 5 min.

Erstellen Sie einen neuen Azure Backup Vault. Dieser wird über das aktuelle Verwaltungsportal (https://manage.windowsazure.com) erstellt.

Name und Region können Sie frei wählen. Zu beachten sind folgende Punkte:
* Übertragungen innerhalb von Europa werden wahrscheinlich zügiger durchgeführt.
* Sofern Sie die Übungen 2 und 3 durchführen möchten, muss sich der Backup Vault in der gleichen Region, wie die VMs befinden.
  
*Optional:* Konfigurieren der Redundanz der gespeicherten Daten. Diese Option ist unter dem Reiter Configure/Konfigurieren zu finden. 
Es ist zu beachten, dass diese Einstellung nur vorgenommen werden kann, solange noch keine Backups durchgeführt wurden.

<img src="..\images\backup_storage.png">

### Ü2: Sicherung einer VM in Azure
Zeitaufwand ca. 10 min.

Sichern Sie eine VM. Diese Aktion starten Sie im Reiter Registered Items (Registrierte Instanzen). 
Bei der Auswahl des Typ muss "Azure Virtual Machine" ausgewählt sein.

Da der Backup-Vorgang einer ganzen VM mehr als 10 Minuten dauert, können Sie die Wiederherstellung nicht im IT Camp üben. 
Probieren Sie dies am besten trotzdem noch nach dem IT Camp aus!

### Ü3: Extra-Übung: Sicherung einer beliebigen Maschine
Zeitaufwand ca. 10 - 15 min.

1. Installieren Sie den Backup Agent auf eine beliebige Windows-VM.  
2. Registrieren Sie den Backup Agent beim Azure Backup Vault.
3. Erstellen Sie einen Backup-Plan und führen Sie ihn direkt aus.
	* Zum Testen wählen Sie am besten nur wenige Verzeichnisse und Dateien zum Sichern aus.

Link: https://go.microsoft.com/fwLink/?LinkID=288905&clcid=0x407

### Ü4: Extra-Übung: Wiederherstellung einer beliebigen Maschine
Zeitaufwand ca. 5 - 10 min.

Sie können zum Test die in Übung 3 gesicherten Daten in einem anderen Pfad auf der gleichen VM wiederherstellen.

## Weiterführende Informationen

[Azure Backup Übersicht](https://azure.microsoft.com/de-de/services/backup/)  
[Azure Backup Dokumentation](https://azure.microsoft.com/de-de/documentation/services/backup/)  
[Azure Backup Preise](https://azure.microsoft.com/de-de/pricing/details/backup/)

[Kurs "Datensicherung mit Azure Backup" in der Microsoft Virtual Academy](https://www.microsoftvirtualacademy.com/de-de/training-courses/datensicherung-mit-azure-backup-13976?l=ZpYkSDvbB_5205192810)

[Site Recovery Übersicht](https://azure.microsoft.com/de-de/services/site-recovery/)  
[Site Recovery Dokumentation](https://azure.microsoft.com/de-de/documentation/services/site-recovery/)  
[Site Recovery Preise](https://azure.microsoft.com/de-de/pricing/details/site-recovery/)
