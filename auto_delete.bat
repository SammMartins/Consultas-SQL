@echo Excluindo Arquivos
pause
set folder="G:\Documentos\Arquivos"
set days=1
forfiles /p %folder% /s /m *.* /d -%days% /c "cmd /c echo Excluindo @file & del /q @path"
@echo Done
pause