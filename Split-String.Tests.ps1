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
        It 'SimpleMatch' {}
        It 'SimpleMatch with MaxCount' {}
        It 'RegexMatch' {}

    }
}