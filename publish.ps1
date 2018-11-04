iex 'cd C:\Users\marvin\PycharmProjects\admindojo-website'
iex '.\venv\Scripts\activate'
Remove-Item docs -Force -Recurse
New-Item -ItemType directory -Path docs
$generate = 'docnado --html docs --nav_limit taskbutler'
iex $generate
$redirect = @"
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="refresh" content="0; url=./w/index.html">
    </head>
<body>
</body>
</html>
"@

Set-Content -Value $redirect -Path docs\index.html


iex 'git subtree split --branch gh-pages --prefix docs/'
#Remove-Item docs -Force -Recurse
