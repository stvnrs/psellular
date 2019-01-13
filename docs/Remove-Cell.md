---
external help file: psellular-help.xml
Module Name: psellular
online version:
schema: 2.0.0
---

# Remove-Cell

## SYNOPSIS
Removes cells from the active queue.

## SYNTAX

```
Remove-Cell [-All]
```

## DESCRIPTION
Removes either the next cell from the active queue or optionally all cells in the acvtive queue.

## EXAMPLES

### Example 1

```powershell
PS C:\> Cell 'C1' {Write-Information 'Cell 1'}
PS C:\> Cell 'C1' {Write-Information 'Cell 2'}
PS C:\> Get-Cell 

Description Scriptblock
----------- -----------
C1          Write-Information 'Cell 1'
C2          Write-Information 'Cell 2'

c
PS C:\> Get-Cell 

Description Scriptblock
----------- -----------
C1          Write-Information 'Cell 1'

PS C:\> 
```

In this example we are adding 2 cells to the queue then removing 1.

### Example 2
```powershell
PS C:\> Cell 'C1' {Write-Information 'Cell 1'}
PS C:\> Cell 'C1' {Write-Information 'Cell 2'}
PS C:\> Get-Cell 

Description Scriptblock
----------- -----------
C1          Write-Information 'Cell 1'
C2          Write-Information 'Cell 2'

PS C:\> Remove-Cell -All
PS C:\> Get-Cell 
PS C:\> 
```

In this example we are adding 2 cells to the queue then removing all of them.

## PARAMETERS

### -All
Removes all loaded cells.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
