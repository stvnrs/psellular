Remove-Module psellular
Import-Module C:\Users\steven\source\repos\psellular\src\psellular.psm1
Cell 'C1' {$v = 'Hello world'}
Cell 'C2'  {$v}
Cell 'C3' {
    if (1 -eq 1){
        Write-Error 'Not exececuted - awaiting C2'
    }
    1/0
}
Skip 2
step

