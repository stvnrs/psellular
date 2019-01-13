class Cell {    
    [string]$Description
    [scriptblock]$Scriptblock

    [string]ToString(){
        return $this.Description
    }

    [string]ToString(){
        $Clone = [Cell]::new()    
        $Clone.Description = $this.Description
        $Clone.Scriptblock = $this.ScriptBlock
        return $Clone
    }
}

class CellInvocationInfo {   
    [int]$Id
    [Cell]$Cell
    [datetime]$StartedAt
    [timespan]$ExecutionTime
    [object]$Error
}

$Script:Cells = New-Object -TypeName 'System.Collections.Generic.LinkedList[Cell]'
$Script:History = New-Object -TypeName System.Collections.ArrayList

function Add-Cell {
    param(
        [string]$Description,
        [scriptblock]$ScriptBlock
    )
    
    $Cell = [Cell]::new()    
    $Cell.Description = $Description
    $Cell.Scriptblock = $ScriptBlock
    $Script:Cells.AddLast($Cell) | Out-null
}

function Remove-Cell {
    param (
        [switch]$All
    )

    if($All.IsPresent){
        $Script:Cells = New-Object -TypeName 'System.Collections.Generic.LinkedList[Cell]'
    } else {
        $Script:Cells.RemoveFirst() | Out-Null
    }
}

function Step-Cell{
    param (
        [int]$Count = 1
    )

    for ($i = 0; $i -lt $Count; $i++) {
        $NumberOfErrorsBefore = $Global:Error.Count

        $Cell = $Script:Cells.First.Value
        $Script:Cells.RemoveFirst()
        $History = [CellInvocationInfo]::new()
        $History.Id = $Script:History.Count + 1
        $History.Cell = $Cell
        $History.StartedAt = Get-Date

        $Measurement =  Measure-Command {
            . $History.Cell.Scriptblock | Out-Default
        }

        $History.ExecutionTime = $Measurement
        $History.Error = New-Object -TypeName ' System.Collections.ArrayList'
        $NumberOfErrorsAfter = $Global:Error.Count
        
        for ($j = 0; $j -lt ($NumberOfErrorsAfter -$NumberOfErrorsBefore); $j++) {
            $History.Error.Add($global:Error[$i]) | Out-Null  
        }
        
        $Script:History.Add($History) | Out-Null
    }
}

function Skip-Cell{
    param (
        [int]$Count = 1
    )

    for ($i = 0; $i -lt $Count; $i++) {        
        $Cell = $Script:Cells.First.Value
        $Script:Cells.RemoveFirst()
        $History = [CellInvocationInfo]::new()
        $History.Id = $Script:History.Count + 1
        $History.Cell = $Cell
        $History.Error = $null
        $Script:History.Add($History) | Out-Null
    }
}

function Get-Cell {
    $Script:Cells.Clone()
}
function Get-InvocationHistory {
    $Script:History.Clone()
}

Set-Alias -Name Cell -Value Add-Cell
Set-Alias -Name Step -Value Step-Cell
Set-Alias -Name Skip -Value Skip-Cell
