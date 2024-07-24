# Active Directory modülünü yüklüyoruz
Import-Module ActiveDirectory

# Tüm Domain Controller'ları alıyoruz
$DCs = Get-ADDomainController -Filter *

# Her bir DC'nin adını bir .txt dosyasına yazıyoruz
foreach ($DC in $DCs) {
    $DC.Hostname | Out-File -FilePath DCList.txt -Append
}