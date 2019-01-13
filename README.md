# psellular

Provides a structure for running scripts inspired by code cell in MATLAB (via adzsroka)


Many process aren't worth fully automating as either as either it will 



```Powershell

# config

# get the stiff from the weird file sharing site that has no APIs

# do some sruff

#chekc somehting (thats os hard to progran

# do more stuff

# run log running async process 

# don;t do this until the job started above has n

```

PSellular provides a structure to make runing jobs/scripts like this lea litte less frustrating.

```Powershell

Cell 'Set up new refresh'  {
    # config for process
    $IngressDate = '2019-10-01'
    $CorrelationID = (New-Guid).Guid
    $ClientId = 486293794

}

Cell 'Spin up process resources'  {
    
}

Cell 'Do weird manual data download' {
    Write-Information "Do the weird download thing, and then run the next cell!"    
}

Cell 'Tear down'  {
    

}
```

```


