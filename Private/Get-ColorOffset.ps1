function Get-ColorOffset {
    [OutputType([int])]
    param
    (
        [ValidateSet('Black', 'Red', 'Green', 'Yellow', 'Blue', 'Magenta', 'Cyan', 'White')]
        [string]$Color
    )

    switch ($Color) {
        'Black' { 0 }
        'Red' { 1 }
        'Green' { 2 }
        'Yellow' { 3 }
        'Blue' { 4 }
        'Magenta' { 5 }
        'Cyan' { 6 }
        'White' { 7 }
    }
}