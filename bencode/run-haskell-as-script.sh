echo "#!/usr/bin/env stack" | cat - $1 > temp.run
chmod +x $PWD/temp.run
$PWD/temp.run
rm $PWD/temp.run
