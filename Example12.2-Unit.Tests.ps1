#this file contains examples of a test.  See https://pester-docs.netlify.app/docs/quick-start for more information


# Pester tests
Describe "Some grouping of tests" {
    It "Does 1=1" {
        1 | Should -Be 1
    }
    It "string should be string" {
        [String]"I am a a string" | Should -BeOfType [System.string]
    }
    It "There should be more than 10 processes running" {
        (Get-Process | Measure-Object).Count | Should -BeGreaterThan 10
    }
    It "Test does not pass" {
        "String" | Should -Be 3
    }
}