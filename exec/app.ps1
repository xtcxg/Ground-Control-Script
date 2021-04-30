Write-Host ">> 原始命令: $args"
[string[]]$ags = $args.Clone(); #args
[string]$cmd = $ags[0]; # cmd
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

for ($i = 0; $i -lt $ags.Count; $i++) {
    if ($ags[$i].Equals("-e")) 
    {
        if ("word".Equals($ags[$i+1]))
        {
            $word = New-Object -ComObject "Word.Application";
            $word.documents.Add()
            $word.Visible = $true;
        }
        break;
    }
    if ($ags[$i].Equals("-s"))
    {
        Write-Host ">> 执行ps1脚本";
        break;
    }
    if ($ags[$i].Equals("-b"))
    {
        Write-Host ">> 执行bat脚本";
        break;
    }
}