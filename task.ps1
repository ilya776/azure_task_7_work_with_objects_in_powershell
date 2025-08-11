# Отримуємо список файлів у папці data
$files = Get-ChildItem -Path "./data" -Filter "*.json"

# Створюємо порожній список для результатів
$regions = @()

foreach ($file in $files) {
    # Читаємо JSON і перетворюємо в об'єкти
    $content = Get-Content -Path $file.FullName | ConvertFrom-Json

    # Перевіряємо, чи є серед них Standard_B2pts_v2
    if ($content.name -contains "Standard_B2pts_v2") {
        # Додаємо назву регіону без .json
        $regionName = $file.BaseName
        $regions += $regionName
    }
}

# Експортуємо результат у JSON
$regions | ConvertTo-Json | Out-File -FilePath "./result.json" -Encoding UTF8
