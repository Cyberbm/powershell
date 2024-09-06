$encryptedBytesWithIV = [Convert]::FromBase64String($encryptedText)     >> $iv = $encryptedBytesWithIV[0..15]
>> $encryptedBytesOnly = $encryptedBytesWithIV[16..($encryptedBytesWithIV.Length - 1)]
>>
>> $aes.IV = $iv
>> $decryptor = $aes.CreateDecryptor()
>> $decryptedBytes = $decryptor.TransformFinalBlock($encryptedBytesOnly, 0, $encryptedBytesOnly.Length)
>>
>> $decryptedText = [Text.Encoding]::UTF8.GetString($decryptedBytes)
>>
>> Write-Host "Decrypted Text: $decryptedText"
Decrypted Text: Red hat Erick
PS C:\Windows\System32> $encryptedBytesWithIV = [Convert]::FromBase64String($encryptedText)
>> $iv = $encryptedBytesWithIV[0..15]
>> $encryptedBytesOnly = $encryptedBytesWithIV[16..($encryptedBytesWithIV.Length - 1)]
>>
>> $aes.IV = $iv
>> $decryptor = $aes.CreateDecryptor()
>> $decryptedBytes = $decryptor.TransformFinalBlock($encryptedBytesOnly, 0, $encryptedBytesOnly.Length)
>>
>> $decryptedText = [Text.Encoding]::UTF8.GetString($decryptedBytes)
>>
>> Write-Host "Código decriptado: $decryptedText"