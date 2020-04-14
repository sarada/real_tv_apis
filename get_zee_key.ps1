Remove-Item C:\Users\manin\Downloads\zee_hsn_key.txt   
Remove-Item C:\Users\manin\Downloads\sony_hsn_key.txt    

Remove-Item D:\ProjectWork\zee_script\real_tv_apis\zee_hsn_key.txt
Remove-Item D:\ProjectWork\zee_script\real_tv_apis\sony_hsn_key.txt
$chrome_process=start-process -FilePath 'c:\Program Files (x86)\Google\Chrome\Application\chrome.exe' 
Start-Sleep -s 45 
cd  D:\ProjectWork\zee_script\real_tv_apis
$FileName = "D:\ProjectWork\zee_script\real_tv_apis\db.json"

$Zee_file="./zee_hsn_key.txt"
$sony_file="./sony_hsn_key.txt"
if (Test-Path $Zee_file) 
{
  Remove-Item $Zee_file
}
 if (Test-Path $sony_file) 
{
  Remove-Item $sony_file
} 
cp C:\Users\manin\Downloads\zee_hsn_key.txt  .
cp C:\Users\manin\Downloads\sony_hsn_key.txt  . 

$sony_content = [IO.File]::ReadAllText("D:\ProjectWork\zee_script\real_tv_apis\sony_hsn_key.txt")
$zee_content  = [IO.File]::ReadAllText("D:\ProjectWork\zee_script\real_tv_apis\zee_hsn_key.txt")

$body ='{  '
$body += "`n"
$body += '    "ch1_hsn": [  '
$body += "`n"
$body += '    { '
$body += "`n"
$body += '       "hsn": "'+$sony_content+'"' | Format-Table -Auto  | Out-String 
$body += "`n"
$body += '    }], '
$body += "`n"
$body += '    "ch2_link": '
$body += "`n"
$body += '    { '
$body += "`n"
$body += '       "link": "'+$zee_content+'"' | Format-Table -Auto  | Out-String 
$body += "`n" 
$body += '    } '
$body += "`n"
$body += '} '
 
if (Test-Path $FileName) 
{
  Remove-Item $FileName
}
 
Set-Content -Path  $FileName $body  
[IO.File]::ReadAllText($FileName)
echo $content2

#Select-String -Pattern "st=" -Context 1,2 D:\ProjectWork\Chrome Extensions\temp\zee_hsn_key.txt
#echo "key is  : :"$hsn_key 
#$chrome_process.CloseMainWindow();
#$chrome_process=$null;
cd "D:\ProjectWork\zee_script\real_tv_apis"
git add $FileName
git commit -m "Changes from console"
git push

