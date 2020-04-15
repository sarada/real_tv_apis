while($true)
{
    echo "Calling scritpt get_zee_key.ps1 " 
	Get-Date -Format "MM/dd/yyyy HH:mm "

		Remove-Item C:\Users\Charu\Downloads\zee_hsn_key*
		Remove-Item C:\Users\charu\Downloads\sony_hsn_key*    

		Remove-Item C:\Users\Charu\tv_git_dir\real_tv_apis\zee_hsn_key.txt
		Remove-Item C:\Users\Charu\tv_git_dir\real_tv_apis\sony_hsn_key.txt
                                                 
		$chrome_process=start-process -FilePath 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe' 
		echo "Waiting for 40 Secs, for Chrome to do its job." 
		Start-Sleep -s 40  
 
 		$FileName = "C:\Users\Charu\tv_git_dir\real_tv_apis\db.json"


		$Zee_file="C:\Users\Charu\tv_git_dir\real_tv_apis\zee_hsn_key.txt"
		$sony_file="C:\Users\Charu\tv_git_dir\real_tv_apis\sony_hsn_key.txt"
		if (Test-Path $Zee_file) 
		{
			Remove-Item $Zee_file
		}
		if (Test-Path $sony_file) 
		{
			Remove-Item $sony_file
		} 
		cp C:\Users\Charu\Downloads\zee_hsn_key.txt  .
		cp C:\Users\Charu\Downloads\sony_hsn_key.txt  .
		 
		$sony_content = [IO.File]::ReadAllText("C:\Users\Charu\tv_git_dir\real_tv_apis\sony_hsn_key.txt")
		$zee_content  = [IO.File]::ReadAllText("C:\Users\Charu\tv_git_dir\real_tv_apis\zee_hsn_key.txt")

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
		 
	 	if($sony_content  -and  $zee_content)
		{
			echo "both keys are there "
			Set-Content -Path  $FileName $body  
			$content2 = [IO.File]::ReadAllText($FileName)
			echo $content2		 
			#cd "D:\ProjectWork\zee_script\real_tv_apis"
			git add $FileName
			git pull 
			git commit -m "Changes from console"
			git push

		}
		else
		{
			echo "Could not fetch key "
		}
 	echo "Waiting for 20 mts!! Starting at" 	
	

	
	Get-Date -Format "MM/dd/yyyy HH:mm "
	Start-Sleep -s 1200 
}