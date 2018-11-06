iex 'cd C:\Users\marvin\PycharmProjects\admindojo-website'
iex '.\venv\Scripts\activate'
Remove-Item docs -Force -Recurse
New-Item -ItemType directory -Path docs
$env:DN_DOCS_DIR = "pages"
$generate = 'docnado --html docs --nav_limit taskbutler,bashblog,admindojo'
iex $generate
$redirect = @"
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="refresh" content="0; url=./w/">
    </head>
<body>
</body>
</html>
"@

Set-Content -Value $redirect -Path docs\index.html
iex 'cd docs'
iex 'git add .'
iex 'cd ..'
iex 'git commit -m "Site update"'
iex 'git subtree split --branch gh-pages --prefix docs/'
#Remove-Item docs -Force -Recurse
