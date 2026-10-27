@echo off
setlocal
cd /d "%~dp0"
set "taskPython=python"
if exist "..\..\work\week5day1\.venv\Scripts\python.exe" set "taskPython=..\..\work\week5day1\.venv\Scripts\python.exe"
if exist ".venv\Scripts\python.exe" set "taskPython=.venv\Scripts\python.exe"
set "PYTHONIOENCODING=utf-8"
set "STREAMLIT_BROWSER_GATHER_USAGE_STATS=false"
"%taskPython%" -c "import os,getpass,subprocess,sys; key=(os.getenv('OPENAI_API_KEY') or getpass.getpass('OpenAI API key (hidden): ')).strip(); exec('if not key.startswith(\'sk-\') or len(key)<20 or any(c.isspace() for c in key):\n print(\'Key was not pasted completely. Copy the full OpenAI secret key and run this file again.\')\n sys.exit(1)'); os.environ['OPENAI_API_KEY']=key; sys.exit(subprocess.call([sys.executable,'-m','streamlit','run','app.py','--server.address','127.0.0.1','--server.port','8503']))"
pause

