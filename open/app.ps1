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

Write-Host ">> final:"$ags[0]
# 打开网页
if ($ags[0].Equals("-u"))
{
    #todo 选择浏览器
    Write-Host ">> 打开网址";
    Start-Process -FilePath $ags[1];
    break;
}
# 打开应用
if ($ags[0].Equals("-e"))
{
    Write-Host ">> 打开程序";
    #Start-Process -FilePath ($Env:WinDir + "\explorer.exe") -ArgumentList "shell:Appsfolder\Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge"
    Start-Process -FilePath $ags[1];
}
