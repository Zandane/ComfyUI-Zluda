@echo off
title Fix for RX480 - 580 and variants
cls
venv\scripts\activate
pip uninstall torch torchvision torchaudio -y
pip install torch==2.2.1 torchvision==0.17.1 torchaudio==2.2.1 --index-url https://download.pytorch.org/whl/cu118
echo ..................................................... 
echo *** "Patching ZLUDA Again"
echo.
rmdir /S /q zluda
curl -s -L https://github.com/lshqqytiger/ZLUDA/releases/download/rel.11cc5844514f93161e0e74387f04e2c537705a82/ZLUDA-windows-amd64.zip > zluda.zip
tar -xf zluda.zip
del zluda.zip
copy zluda\cublas.dll venv\Lib\site-packages\torch\lib\cublas64_11.dll /y
copy zluda\cusparse.dll venv\Lib\site-packages\torch\lib\cusparse64_11.dll /y
copy zluda\nvrtc.dll venv\Lib\site-packages\torch\lib\nvrtc64_112_0.dll /y
echo.
@echo  *ZLUDA is patched. *
echo.
echo ..................................................... 
echo *** Installation is done. --
echo .....................................................
echo.
