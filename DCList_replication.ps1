# dosya adını DCList.txt olarak belirliyoruz
$DCListFile = "DCList.txt"

# Dosyayı oluşturuyoruz ve içerisine Domain Controller listemizi yazıyoruz
New-Item -ItemType file -Path $DCListFile -Force

# DCList.txt dosyasını okuyoruz ve her bir satırı bir Domain Controller olarak kabul ediyoruz
$DCs = Get-Content $DCListFile

# Her bir DC için replikasyonu tetikliyoruz
foreach($DC in $DCs) {
    # Replikasyonu tetikliyoruz
    repadmin /replicate $DC * /A /e /d /q
}

# DC listesi dosyasını siliyoruz
Remove-Item -Path $DCListFile