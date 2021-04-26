Write-Host ">> 原始命令: $args"
[string[]]$ags = $args.Clone(); #args
[string]$cmd = $ags[0]; # cmd
$ags = $ags[1..$ags.Length];
Write-Host ">> cmd $cmd";
Write-Host ">> 删除cmd: $ags"

[string[]]$prop = @(); #prop
if (([string]$ags[$ags.Length - 1]) -match "^\[\[\[.*\]\]\]$" ) 
{
    $data = [string]$ags[$ags.Length - 1];
    $data = $data.Substring(3,$data.Length-6);
    $prop = $data.Split("+++");
    Write-Host ">> prop: $prop"
    $ags = $ags[0..($ags.Length - 2)];
    
}

Write-Host ">> 最终: $ags"
for ($i = 0; $i -lt $ags.Count; $i++) {
    if ($ags[$i].Equals("-u")) 
    {
        Start-Process -FilePath $ags[$i+1];
        break;
    }
    if ($ags[$i].Equals("-f"))
    {
        Write-Host ">> 打开文件";
        break;
    }
}


function createProp  
{
    param([string]$data) 
    Write-Host ">> 处理prop: $data"
    $data = $data.Substring(3,$data.Length-3);
    [stirng[]] $array = $data.Split("+++");
    retrun $array;
} 
