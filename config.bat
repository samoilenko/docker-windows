 "C:\Program Files\Git\bin\bash.exe" start.sh %1
 
 FOR /f "tokens=*" %%i IN ('docker-machine env %1') DO %%i
 
SET codeDir=/projectCode
SET mountFolderName=project
docker-machine ssh %1 "sudo mkdir -p \"%codeDir%\""

"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" sharedfolder add %1 --name "%mountFolderName%" --hostpath "%CD%" --transient

docker-machine ssh %1 "sudo mount -t vboxsf -o users,rw \"%mountFolderName%\" \"%codeDir%\""