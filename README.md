# Ground-Control-Script
为Ground-Control提供执行脚本

将文件夹放在script/目录下
<pre>
./
-|Ground-Control.exe
-|script/
- -|open/
- - -|app.ps1
- - -|conf.js
- -|exec/
-|data/
</pre>

## open
打开命令

> -u : 打开网址（open -u https://github.com）

> -f : 打开文件/文件夹（open -f C:\Users）

## exec
执行
> -e : 执行可执行程序 （exec -e D:\Git\git-cmd.exe）

> -s : 执行.ps1脚本

> -b : 执行.bat脚本

> -n : -n或不加参数，使用powershell执行后续命令 （exec java D:\Main.class 实际为使用powershell运行 java D:\Main.class）
