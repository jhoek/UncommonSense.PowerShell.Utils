BeforeAll {
    Get-Module UncommonSense.PowerShell.Utils -ListAvailable | Import-Module
}

Describe 'Split-String' {
    Context 'Parameter passing' {
        It 'Single string as parameter' {
            Split-String -InputObject 'ABCDEFG' -Separator 'C' | Should -Be 'AB', 'DEFG'
        }

        It 'Multiple strings as parameters' {
            Split-String -InputObject 'ABCDEFG', 'PQRSTCV' -Separator 'C' | Should -Be 'AB', 'DEFG', 'PQRST', 'V'
        }

        It 'Single string via pipeline' {
            'ABCDEFG' | Split-String -Separator 'C' | Should -Be 'AB', 'DEFG'
        }

        It 'Multiple strings via pipeline' {
            'ABCDEFG', 'PQRSTCV' | Split-String -Separator 'C' | Should -Be 'AB', 'DEFG', 'PQRST', 'V'
        }
    }

    Context 'ScriptBlock' {
        It 'Scriptblock' {
            'ABCDEFG' | Split-String -ScriptBlock { $_ -in 'B', 'D' } | Should -Be 'A', 'C', 'EFG'
        }

        It 'ScriptBlock with MaxCount' {
            'ABCDECGCIJCLMNOP' | Split-String -ScriptBlock { $_ -eq 'C' } -MaxCount 3 | Should -Be 'AB', 'DE', 'GCIJCLMNOP'
        }
    }

    Context 'Delimiter' {
        It 'SimpleMatch' {
            'ABCDEF' | Split-String -Separator 'D' -SimpleMatch -MaxCount ([int]::MaxValue) | Should -Be 'ABC', 'EF'
        }

        It 'SimpleMatch with MaxCount' {
            'ABCDECFGHCPQR' | Split-String -Separator 'C' -MaxCount 3 -SimpleMatch | Should -Be 'AB', 'DE', 'FGHCPQR'
        }

        It 'SimpleMatch with MaxCount and IgnoreCase' {
            'ABCDECFGHCPQR' | Split-String -Separator 'c' -MaxCount 3 -SimpleMatch -IgnoreCase | Should -Be 'AB', 'DE', 'FGHCPQR'
        }

        It 'RegexMatch' {
            'ABCDEFGHIJ' | Split-String -Separator '[EF]' | Should -Be 'ABCD', '', 'GHIJ'
        }

        It 'RegexMatch with MaxCount' {

        }

        It 'RegexMatch with MaxCount and IgnoreCase' {

        }
    }
}