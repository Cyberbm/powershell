# Entrada para criptografar
$textToEncrypt = "Script de cybersegurança :)"
$bytesToEncrypt = [Text.Encoding]::UTF8.GetBytes($textToEncrypt)

# Criação e configuração do AES
$aes = [System.Security.Cryptography.Aes]::Create()
$aes.Mode = [System.Security.Cryptography.CipherMode]::CBC
$aes.Padding = [System.Security.Cryptography.PaddingMode]::PKCS7

# Geração da chave e IV
$aes.GenerateKey()
$aes.GenerateIV()

# Criar o encryptor
$encryptor = $aes.CreateEncryptor()

# Criptografia
$encryptedBytes = $encryptor.TransformFinalBlock($bytesToEncrypt, 0, $bytesToEncrypt.Length)

# Combinar IV e bytes criptografados
$combined = New-Object byte[] ($aes.IV.Length + $encryptedBytes.Length)
[Array]::Copy($aes.IV, 0, $combined, 0, $aes.IV.Length)
[Array]::Copy($encryptedBytes, 0, $combined, $aes.IV.Length, $encryptedBytes.Length)

# Converter para Base64
$encryptedText = [Convert]::ToBase64String($combined)

# Exibir o texto criptografado
Write-Host "Texto criptografado: $encryptedText"
