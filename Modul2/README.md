# Modul 2 - Hybride Infrastrukturen
## Themen
* Virtuelle Netzwerke
* VPN-Verbindungen
* Azure Automation
* Azure Active Directory

## Demo
1. Azure Active Directory einrichten
2. Azure AD Application Proxy konfigurieren
3. Virtuelles Netzwerk einrichten (ASM)
4. Point-to-Site (P2S) einrichten (ASM)

## Hands-On

### Ü1: Übung: Ein neues Azure Active Directory erstellen
Zeitaufwand ca. 5 min.  
Diese Übung ist empfehlenswert, wenn Sie im Modul 4 die Extra-Übung zur Erstellung 
Automatisierungsskripten für Azure in Azure Automation durchführen möchten.

Erstellen Sie ein neues Azure Active Directory und legen Sie mindestens ein Test-Benutzerkonto an, 
dem Sie die Rolle "Global Administrator" zuweisen.

Das Passwort des neuen Test-Benutzers muss vor der Benutzung geändert werden.  
Am besten machen Sie dies in einer InPrivate- bzw. Inkognito-Session.  
Als Adresse für die Anmeldung können Sie https://myapps.microsoft.com verwenden.  

**Schreiben Sie sich das neue Passwort für den Test-Benutzer am besten auf.** 

### Ü2: Übung: Azure AD Application Proxy konfigurieren
Zeitaufwand ca. 15 - 20 min.

*Achtung:* Diese Übung benötigt Azure Active Directory Premium. 
Für jedes neue AAD kann ein kostenfreier 30-Tage-Test durchgeführt werden.

1. Installieren Sie den [AAD Application Proxy](https://go.microsoft.com/fwLink/?LinkID=395018&clcid=0x409) auf einem Windows-Server, auf dem ein Web-Server installiert ist.  
2. Konfigurieren Sie den neuen Application Proxy als Azure AD Application.
3. Testen Sie den Zugang.

### Ü3: Extra-Übung: Virtuelles Netzwerk einrichten (ASM)
Zeitaufwand ca. 5 min.

Im aktuellen Verwaltungsportal (ASM) ein neues virtuelles Netzwerk erstellen.

* Der Name kann frei gewählt werden.
* Die Region kann auch frei gewählt werden.

*Hinweis:*
Die Verwendung virtueller Netzwerke über den Azure Ressource Manager 
wäre auch möglich. Allerdings unterstützt das neue Portal derzeit 
nicht die Erstellung von P2S-Verbindungen, so dass die Konfiguration über 
PowerShell notwendig wäre.

Falls Sie vorhaben, Extra-Übung 5 durchzuführen, dann erstellen Sie jetzt am besten 
gleich eine weitere VM in dem neu erstellten virtuellen Netzwerk.

### Ü4: Extra-Übung: Point-to-Site (P2S) einrichten (ASM)
Zeitaufwand ca. 20 - 40 min.  
Benötigt ein eingerichtetes virtuelles Netzwerk über ASM. (Vorherige Übung.)

*Hinweis:* Site-to-Site (S2S) kann derzeit leider nicht mit der simulierten On-Prem-Umgebung nachgestellt werden.

1. P2S für ein virtuelles Netzwerk konfigurieren.
	* Aktivieren
	* Adressbereich für Client definieren
	* Gateway-Subnetz hinzufügen
2. Root- und Client-Zertifikate erstellen.
3. Öffentlichen Teil des Root-Zertifikats für das virtuelle Netzwerk zu Azure hochladen.
4. Gateway erstellen. Dies dauert zwischen 20 und 40 Minuten. Daher kann diese Übung nicht direkt im Praxisteil beendet werden.
5. Client-Zertifikat (inkl. privatem Schlüssel) auf einem Client installieren.
	* Dies kann zu Test-Zwecken eine Test-VM sein, die eventuell im ersten Modul
	bereits erstellt haben.
6. VPN-Profil auf dem Client installieren.
7. Per P2S (VPN) mit dem virtuellen Netzwerk verbinden.
	* Achtung: Da die Gateway-Erstellung 20 bis 40 Minuten in Anspruch nimmt, kann Schritt 7 und 8 erst später durchgeführt werden.
8. Optional: erhaltene VPN-Client-IP-Adresse überprüfen.

Es können die vorgefertigen Test-Zertifikate verwendet werden oder mit makecert 
eigene Zertifikate erstellt werden. 
* Erfordert makecert, welches auf den Teilnehmer-Laptops vorinstalliert ist.
* makecert ist u.a. Bestandteil von Visual Studio oder den Windows SDKs.

Die vorgefertigten Zertifikate können Sie hier herunterladen:  
[root.pfx](https://github.com/pkirch/hybridit15/raw/master/Modul2/root.pfx)  
[root.cer](https://github.com/pkirch/hybridit15/raw/master/Modul2/root.cer)  
[client.pfx](https://github.com/pkirch/hybridit15/raw/master/Modul2/client.pfx)

Das Passwort für die PFX-Dateien lautet "Azure ist toll!"

**Befehlszeilen für makezert:**  
Stammzertifikat  
makecert -sky exchange -r -n "CN=IT Camp Hybrid IT - P2S-Root" -pe -a sha1 -len 2048 -ss My

Client-Zertifikat  
makecert.exe -n "CN=IT Camp Hybrid IT - Client" -pe -sky exchange -m 96 -ss My -in "IT Camp Hybrid IT - P2S-Root" -is my -a sha1

### Ü5: Extra-Übung: Auf Web-Server im neuen VNet zugreifen
Zeitaufwand ca. 15 min.  
Diese Übung setzt die ersten beiden Übungen in diesem Modul voraus. 
D.h. ein virtuelles Netzwerk und eine P2S-Verbindung müssen eingerichtet sein.

1. Eine neue virtuelle Maschine im neu erstellten virtuellen Netzwerk erstellen. (Sofern nicht schon in Übung 3 geschehen.)
	* Keine besonderen Ports für Web für die VM konfigurieren. Der Zugriff 
	soll später per P2S (VPN) erfolgen.
2. Bei einer Windows Server-VM die Web Server-Rolle installieren.
	* Am schnellsten per PowerShell mit *Add-WindowsFeature Web-Server*
	* Lokal auf der VM prüfen, dass die Startseite vom IIS aufgerufen werden kann. 
	(http://localhost/)
4. Von der VM aus der zweiten Übung in das virtuelle Netzwerk per P2S verbinden.
5. Von der VM aus der zweiten Übung im Browser die Startseite des Web-Servers 
	aus Schritt 2 öffnen. 



## Weiterführende Links

[Virtuelle Netzwerke Übersicht](https://azure.microsoft.com/de-de/services/virtual-network/)  
[Virtuelle Netzwerke Dokumentation](https://azure.microsoft.com/de-de/documentation/services/virtual-network/)  
[Virtuelle Netzwerke Preise](https://azure.microsoft.com/de-de/pricing/details/virtual-network/)

[Azure Active Directory Übersicht](https://azure.microsoft.com/de-de/services/active-directory/)  
[Azure Active Directory Dokumentation](https://azure.microsoft.com/de-de/documentation/services/active-directory/)  
[Azure Active Directory Preise](https://azure.microsoft.com/de-de/pricing/details/active-directory/)

[Azure Resource Explorer (Preview)](https://resources.azure.com/)

[Kurs "Das eigene Test Lab für jeden – mit IaaS von Microsoft Azure" in der Microsoft Virtual Academy](https://www.microsoftvirtualacademy.com/de-de/training-courses/das-eigene-test-lab-fr-jeden-mit-iaas-von-microsoft-azure-11743?l=2IEWUkkEB_6604984382)

[Vortrag Hybrid Automation & Identity mit Microsoft Azure von der ShareDev Cologne 2015 (auf Channel 9)](https://channel9.msdn.com/Events/community-germany/ShareDev-Cologne-2015/Hybrid-Automation--Identity-mit-Microsoft-Azure)

## Abkürzungen

AAD: Azure Active Directory  
ASM: Azure Service Management  
P2S: Point-to-Site  
VNet: Virtuelles Netzwerk