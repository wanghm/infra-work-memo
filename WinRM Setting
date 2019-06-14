
## WinRM Setting

Run by Administrator user

### 1.   
```winrm quickconfig```

### 2.  
	
```Enable-PSRemoting```

### 3.   
```Enable-PSRemoting -SkipNetworkProfileCheck```

### 4.   
```
Set-Item WSMan:\localhost\Client\TrustedHosts -Value <Hostname or IP or *>
Set-Item WSMan:\localhost\Client\TrustedHosts * -Force
```

### 5. Confirm

```Get-Item WSMan:\localhost\Client\TrustedHosts```
```winrm enumerate winrm/config/listener```


### Run remote batch

#### Modify Mac Address

```Set-NetAdapter -Name "Ethernet 1" -MacAddress "00-10-18-57-1B-0D"```

```
$pass = ConvertTo-SecureString -AsPlainText -Force "xxxxxxxx"
$psc = New-Object System.Management.Automation.PSCredential("Administrator",$pass)
Invoke-Command 10.48.109.31 { C:\test.bat } -Credential $psc
```
