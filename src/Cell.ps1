class Cell {    
    [string]$Description
    [scriptblock]$Scriptblock

    [string]ToString(){
        return $this.Description
    }
}

class CellInvocationInfo {   
    [int]$Id
    [Cell]$Cell
    [datetime]$StartedAt
    [timespan]$ExecutionTime
    [object]$Error
}