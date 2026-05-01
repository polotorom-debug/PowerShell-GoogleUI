Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# ---------------- MAIN WINDOW ----------------
$form = New-Object System.Windows.Forms.Form
$form.Text = "Google"
$form.Size = New-Object System.Drawing.Size(900,600)
$form.StartPosition = "CenterScreen"
$form.BackColor = "White"

$title = New-Object System.Windows.Forms.Label
$title.Text = "Google"
$title.Font = New-Object System.Drawing.Font("Arial", 48, [System.Drawing.FontStyle]::Bold)
$title.AutoSize = $true
$title.ForeColor = "Blue"
$title.Location = New-Object System.Drawing.Point(330,80)
$form.Controls.Add($title)

$searchBox = New-Object System.Windows.Forms.TextBox
$searchBox.Size = New-Object System.Drawing.Size(400,30)
$searchBox.Location = New-Object System.Drawing.Point(250,200)
$form.Controls.Add($searchBox)

$btnSearch = New-Object System.Windows.Forms.Button
$btnSearch.Text = "Search"
$btnSearch.Location = New-Object System.Drawing.Point(300,250)
$form.Controls.Add($btnSearch)

$btnNothing = New-Object System.Windows.Forms.Button
$btnNothing.Text = "Nothing occurs"
$btnNothing.Location = New-Object System.Drawing.Point(420,250)
$form.Controls.Add($btnNothing)

$dotsLabel = New-Object System.Windows.Forms.Label
$dotsLabel.Text = ""
$dotsLabel.Font = New-Object System.Drawing.Font("Arial", 24)
$dotsLabel.AutoSize = $true
$dotsLabel.Location = New-Object System.Drawing.Point(420,320)
$form.Controls.Add($dotsLabel)
Start-Sleep -Milliseconds 500

function Show-Loading {
    for ($i=0; $i -lt 5; $i++) {
        $dotsLabel.Text = "." * (($i % 3) + 1)
        Start-Sleep -Milliseconds 500
        $form.Refresh()
    }
}

function Show-SmallWindow {
    param([string]$windowTitle, [string]$content)
    $small = New-Object System.Windows.Forms.Form
    $small.Text = $windowTitle
    $small.Size = New-Object System.Drawing.Size(400,300)
    $small.StartPosition = "CenterScreen"
    $small.BackColor = "White"
    $lbl = New-Object System.Windows.Forms.Label
    $lbl.Text = $content
    $lbl.AutoSize = $true
    $lbl.Location = New-Object System.Drawing.Point(20,20)
    $lbl.MaximumSize = New-Object System.Drawing.Size(360,0)
    $small.Controls.Add($lbl)
    $small.ShowDialog()
}

function Show-Result {
    param([string]$searchQuery)

    $r = New-Object System.Windows.Forms.Form
    $r.Text = "Google Search"
    $r.Size = New-Object System.Drawing.Size(900,600)
    $r.StartPosition = "CenterScreen"
    $r.BackColor = "White"

    $miniTitle = New-Object System.Windows.Forms.Label
    $miniTitle.Text = "Google"
    $miniTitle.Font = New-Object System.Drawing.Font("Arial", 18, [System.Drawing.FontStyle]::Bold)
    $miniTitle.Location = New-Object System.Drawing.Point(10,10)
    $miniTitle.AutoSize = $true
    $r.Controls.Add($miniTitle)

    $miniSearch = New-Object System.Windows.Forms.TextBox
    $miniSearch.Size = New-Object System.Drawing.Size(400,25)
    $miniSearch.Location = New-Object System.Drawing.Point(100,12)
    $r.Controls.Add($miniSearch)

    $linkY = 100

    if ($searchQuery.ToLower() -eq "hola") {
        $resultLabel = New-Object System.Windows.Forms.Label
        $resultLabel.Text = "hola"
        $resultLabel.Font = New-Object System.Drawing.Font("Arial", 16)
        $resultLabel.ForeColor = "Blue"
        $resultLabel.AutoSize = $true
        $resultLabel.Location = New-Object System.Drawing.Point(50,$linkY)
        $r.Controls.Add($resultLabel)

        $linkLabel = New-Object System.Windows.Forms.Label
        $linkLabel.Text = "https://photos.xgroovy.com/contents/albums/sources/721000/721388/808990.jpg"
        $linkLabel.Font = New-Object System.Drawing.Font("Arial", 10)
        $linkLabel.ForeColor = "Blue"
        $linkLabel.AutoSize = $true
        $linkLabel.Location = New-Object System.Drawing.Point(50,($linkY + 30))
        $linkLabel.Cursor = [System.Windows.Forms.Cursors]::Hand
        $linkLabel.Add_Click({
            Start-Process "https://photos.xgroovy.com/contents/albums/sources/721000/721388/808990.jpg"
        })
        $r.Controls.Add($linkLabel)
    } else {
        $error = New-Object System.Windows.Forms.Label
        $error.Text = "Los servidores de NVIDIA fallaron al reproducir la busqueda.`nError de conexion con Google Services."
        $error.ForeColor = "Red"
        $error.Size = New-Object System.Drawing.Size(800,100)
        $error.Location = New-Object System.Drawing.Point(50,120)
        $r.Controls.Add($error)
    }

    $linkContainer = New-Object System.Windows.Forms.Label
    $linkContainer.Text = ""
    $linkContainer.AutoSize = $true
    $linkContainer.Location = New-Object System.Drawing.Point(50,220)
    $r.Controls.Add($linkContainer)

    $links = @(
        @{Text="About Google"; Action={
            Show-SmallWindow -windowTitle "About Google" -content "Google es una empresa tecnologica multinacional estadounidense.`nFue fundada en 1998 por Larry Page y Sergey Brin.`nGoogle ofrece una variedad de productos y servicios:`n- Buscador web Google`n- Google Maps`n- YouTube`n- Android`n- Gmail`n- Google Drive`n- Google Cloud`nY muchos mas."
        }},
        @{Text="Google Earth"; Action={
            $earthError = New-Object System.Windows.Forms.Form
            $earthError.Text = "404 Not Found"
            $earthError.Size = New-Object System.Drawing.Size(350,150)
            $earthError.StartPosition = "CenterScreen"
            $earthError.BackColor = "White"
            $errLbl = New-Object System.Windows.Forms.Label
            $errLbl.Text = "404 Not Found`n`nThe requested URL was not found on this server."
            $errLbl.Font = New-Object System.Drawing.Font("Arial", 14)
            $errLbl.ForeColor = "Red"
            $errLbl.AutoSize = $true
            $errLbl.Location = New-Object System.Drawing.Point(50,40)
            $earthError.Controls.Add($errLbl)
            $earthError.ShowDialog()
        }},
        @{Text="Privacy"; Action={
            Show-SmallWindow -windowTitle "Privacy" -content "Ethan Alexandre Reed, 14 anos.`nProgramador web experimentado.`nProyectos como este y mejores en GitHub:`nhttps://github.com/polotorom-debug`n`nRepositorio actual:`nhttps://github.com/polotorom-debug/inwhiteOS"
        }},
        @{Text="Terms"; Action={
            Show-SmallWindow -windowTitle "Terms" -content "Como usar este codigo:`n`n1. Copia todo el codigo del archivo`n2. Guardalo como .ps1 (PowerShell script)`n3. Ejecutalo con PowerShell`n`nEste es un buscador simulado estilo Google`ncreado con PowerShell y Windows Forms.`nEl codigo es de codigo abierto y libre`nde usar para cualquier proposito.`nSolo manten el credito al autor original.`n`nCreado por Ethan Alexandre Reed."
        }}
    )

    $xPos = 50
    foreach ($link in $links) {
        $lbl = New-Object System.Windows.Forms.Label
        $lbl.Text = $link.Text
        $lbl.Font = New-Object System.Drawing.Font("Arial", 11)
        $lbl.ForeColor = "Blue"
        $lbl.AutoSize = $true
        $lbl.Location = New-Object System.Drawing.Point($xPos,220)
        $lbl.Cursor = [System.Windows.Forms.Cursors]::Hand
        $lbl.Tag = $link.Action
        $lbl.Add_Click($link.Action)
        $r.Controls.Add($lbl)
        $xPos += $lbl.PreferredWidth + 20
    }

    $yt = New-Object System.Windows.Forms.Button
    $yt.Text = "Only YouTube works"
    $yt.Location = New-Object System.Drawing.Point(50,280)
    $yt.Add_Click({
        Start-Process "https://el2.phncdn.com/pics/gifs/054/368/481/54368481a.webm?validfrom=1777591362&validto=1777605762&rate=1200k&burst=1433600k&ipa=1&hash=NUGtXNz6FEHZnYGbbEXufAbGwF8%3D"
    })
    $r.Controls.Add($yt)

    $r.ShowDialog()
}

$btnSearch.Add_Click({
    $query = $searchBox.Text
    if ([string]::IsNullOrWhiteSpace($query)) {
        [System.Windows.Forms.MessageBox]::Show("Error: The search bar is empty. Please enter a search term.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        return
    }
Show-Loading
    Show-Result -searchQuery $query
})

$btnNothing.Add_Click({
    [System.Windows.Forms.MessageBox]::Show("Nothing occurred.")
})

$form.ShowDialog()