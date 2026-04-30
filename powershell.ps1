Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# ---------------- WINDOW PRINCIPAL ----------------
$form = New-Object System.Windows.Forms.Form
$form.Text = "Google"
$form.Size = New-Object System.Drawing.Size(900,600)
$form.StartPosition = "CenterScreen"
$form.BackColor = "White"

# ---------------- TITULO GOOGLE ----------------
$title = New-Object System.Windows.Forms.Label
$title.Text = "Google"
$title.Font = New-Object System.Drawing.Font("Arial", 48, [System.Drawing.FontStyle]::Bold)
$title.AutoSize = $true
$title.ForeColor = "Blue"
$title.Location = New-Object System.Drawing.Point(330,80)
$form.Controls.Add($title)

# ---------------- SEARCH BOX ----------------
$searchBox = New-Object System.Windows.Forms.TextBox
$searchBox.Size = New-Object System.Drawing.Size(400,30)
$searchBox.Location = New-Object System.Drawing.Point(250,200)
$form.Controls.Add($searchBox)

# ---------------- BUTTON SEARCH ----------------
$btnSearch = New-Object System.Windows.Forms.Button
$btnSearch.Text = "Search"
$btnSearch.Location = New-Object System.Drawing.Point(300,250)
$form.Controls.Add($btnSearch)

# ---------------- BUTTON NOTHING OCCURS ----------------
$btnNothing = New-Object System.Windows.Forms.Button
$btnNothing.Text = "Nothing occurs"
$btnNothing.Location = New-Object System.Drawing.Point(420,250)
$form.Controls.Add($btnNothing)

# ---------------- LOADING DOTS ----------------
$dotsLabel = New-Object System.Windows.Forms.Label
$dotsLabel.Text = ""
$dotsLabel.Font = New-Object System.Drawing.Font("Arial", 24)
$dotsLabel.AutoSize = $true
$dotsLabel.Location = New-Object System.Drawing.Point(420,320)
$form.Controls.Add($dotsLabel)

# animación puntos
function Show-Loading {
    for ($i=0; $i -lt 5; $i++) {
        $dotsLabel.Text = "." * (($i % 3) + 1)
        Start-Sleep -Milliseconds 500
        $form.Refresh()
    }
}

# ---------------- RESULT WINDOW ----------------
function Show-Result {

    $r = New-Object System.Windows.Forms.Form
    $r.Text = "Google Search"
    $r.Size = New-Object System.Drawing.Size(900,600)
    $r.StartPosition = "CenterScreen"
    $r.BackColor = "White"

    # top bar
    $miniTitle = New-Object System.Windows.Forms.Label
    $miniTitle.Text = "Google"
    $miniTitle.Font = New-Object System.Drawing.Font("Arial", 18, [System.Drawing.FontStyle]::Bold)
    $miniTitle.Location = New-Object System.Drawing.Point(10,10)
    $miniTitle.AutoSize = $true
    $r.Controls.Add($miniTitle)

    # search bar mini
    $miniSearch = New-Object System.Windows.Forms.TextBox
    $miniSearch.Size = New-Object System.Drawing.Size(400,25)
    $miniSearch.Location = New-Object System.Drawing.Point(100,12)
    $r.Controls.Add($miniSearch)

    # error text
    $error = New-Object System.Windows.Forms.Label
    $error.Text = "Los servidores de NVIDIA fallaron al reproducir la búsqueda.`nError de conexión con Google Services."
    $error.ForeColor = "Red"
    $error.Size = New-Object System.Drawing.Size(800,100)
    $error.Location = New-Object System.Drawing.Point(50,120)
    $r.Controls.Add($error)

    # links estilo google
    $links = New-Object System.Windows.Forms.Label
    $links.Text = "About Google   |   Google Earth   |   Privacy   |   Terms"
    $links.ForeColor = "Blue"
    $links.AutoSize = $true
    $links.Location = New-Object System.Drawing.Point(50,250)
    $r.Controls.Add($links)

    # botón YouTube redirect
    $yt = New-Object System.Windows.Forms.Button
    $yt.Text = "Only YouTube works"
    $yt.Location = New-Object System.Drawing.Point(50,300)

    $yt.Add_Click({
        Start-Process "https://silly-mousse-64f9f2.netlify.app/"
    })

    $r.Controls.Add($yt)

    $r.ShowDialog()
}

# ---------------- EVENTS ----------------
$btnSearch.Add_Click({
    Show-Loading
    Show-Result
})

$btnNothing.Add_Click({
    [System.Windows.Forms.MessageBox]::Show("Nothing occurred.")
})

# ---------------- RUN ----------------
$form.ShowDialog()