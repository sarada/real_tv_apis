#$chrome_process=start-process -FilePath 'c:\Program Files (x86)\Google\Chrome\Application\chrome.exe' -ArgumentList 'https://www.zee5.com/channels/details/andtv-hd/0-9-tvhd_0'  

#Start-Sleep -s 15
mv  'C:\Users\manin\Downloads\zee_hsn_key*'   'D:\ProjectWork\Chrome Extensions\temp\'
mv  'C:\Users\manin\Downloads\sony_hsn_key*'   'D:\ProjectWork\Chrome Extensions\temp\'
$sony_content = [IO.File]::ReadAllText("D:\ProjectWork\Chrome Extensions\temp\sony_hsn_key.txt")
$zee_content = [IO.File]::ReadAllText("D:\ProjectWork\Chrome Extensions\temp\zee_hsn_key.txt")

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
$body += '       "hsn": "'+$zee_content+'"' | Format-Table -Auto  | Out-String 
$body += "`n" 
$body += '    } '
$body += "`n"
$body += '} '
echo $body
 
$FileName = "D:\ProjectWork\zee_script\real_tv_apis\db.json"
if (Test-Path $FileName) 
{
  Remove-Item $FileName
}
 
Set-Content -Path  $FileName -$body  
[IO.File]::ReadAllText("D:\ProjectWork\zee_script\real_tv_apis\db.json")
echo $content2




#$hsn_key= [regex]::Matches($hsn_key[1],  'st=')
  
#Select-String -Pattern "st=" -Context 1,2 D:\ProjectWork\Chrome Extensions\temp\zee_hsn_key.txt
#echo "key is  : :"$hsn_key 
#$chrome_process.CloseMainWindow();
#$chrome_process=$null;
cd "D:\ProjectWork\zee_script\real_tv_apis"
git add $FileName
git commit -m "Changes from console"
git push