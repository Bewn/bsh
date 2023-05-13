echo "#!/usr/bin/env stack" | cat - $1 > temp
chmod +x $PWD/temp
$PWD/temp
rm $PWD/temp
