@echo off
setlocal
cd /d "%~dp0"
set "taskPython=python"
if exist "..\..\work\week5day1\.venv\Scripts\python.exe" set "taskPython=..\..\work\week5day1\.venv\Scripts\python.exe"
if exist ".venv\Scripts\python.exe" set "taskPython=.venv\Scripts\python.exe"
set "PYTHONIOENCODING=utf-8"
"%taskPython%" -c "import os,getpass,subprocess,sys; os.environ['OPENAI_API_KEY']=(os.getenv('OPENAI_API_KEY') or getpass.getpass('OpenAI API key (hidden): ')).strip(); exec('for city in [\'Chennai\',\'Paris\']:\n print(\'\\nTesting city: \'+city,flush=True)\n result=subprocess.run([sys.executable,\'weather_news.py\'],input=city+chr(10),text=True,encoding=\'utf-8\')\n if result.returncode: sys.exit(result.returncode)')"
pause
