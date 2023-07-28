BeforeAll {
    Get-Module UncommonSense.PowerShell.Utils -ListAvailable | Import-Module
}

Describe 'Split-String' {
    Context 'Parameter passing' {
        It 'Single string as parameter' {
            Split-String -InputObject 'ABCDEFG' -Separator 'C' | Should -Be 'AB', 'DEFG'
        }

        It 'Multiple strings a parameter' {
            Split-String -InputObject 'ABCDEFG', 'PQRSTCV' -Separator 'C' | Should -Be 'AB', 'DEFG', 'PQRST', 'V'
        }

        It 'Single string via pipeline' {
            'ABCDEFG' | Split-String -Separator 'C' | Should -Be 'AB', 'DEFG'
        }

        It 'Multiple string via pipeline' {
            'ABCDEFG', 'PQRSTCV' | Split-String -Separator 'C' | Should -Be 'AB', 'DEFG', 'PQRST', 'V'
        }
    }

    Context 'ScriptBlock' {
        It 'Scriptblock' {
            'ABCDEFG' | Split-String -ScriptBlock { $_ -in 'B', 'D' } | Should -Be 'A', 'C', 'EFG'
        }

        It 'ScriptBlock with MaxCount' {

        }
    }
}