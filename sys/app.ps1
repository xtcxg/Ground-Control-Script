# cmd
[string]$cmd = $args[0]; # cmd

# args
[string[]]$ags = $args.Clone();
$ags = $ags[1..$ags.Length];

[string[]]$prop = @(); #prop
if (([string]$ags[$ags.Length - 1]) -match "^\[\[\[.*\]\]\]$" ) 
{
    $data = [string]$ags[$ags.Length - 1];
    $data = $data.Substring(3,$data.Length-6);
    $prop = $data.Split("+++");
    Write-Host ">> prop: $prop"
    $ags = $ags[0..($ags.Length - 2)];
    
}

if("reboot".Equals($cmd))
{
    Write-Host "reboot";
    Restart-Computer;
}

if("shutdown".Equals($cmd))
{
    Write-Host "shutdown";
    Stop-Computer;
}

if("sleep".Equals($cmd))
{
    Write-Host "sleep";
    #Stop-Computer -s 3;
}