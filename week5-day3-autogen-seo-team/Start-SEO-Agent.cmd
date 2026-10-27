@echo off
setlocal
cd /d "%~dp0"
set "taskPython=python"
if exist "..\..\work\week5day1\.venv\Scripts\python.exe" set "taskPython=..\..\work\week5day1\.venv\Scripts\python.exe"
if exist ".venv\Scripts\python.exe" set "taskPython=.venv\Scripts\python.exe"
set "PYTHONIOENCODING=utf-8"
set "STREAMLIT_BROWSER_GATHER_USAGE_STATS=false"
"%taskPython%" -c "import os,getpass,subprocess,sys; os.environ['OPENAI_API_KEY']=(os.getenv('OPENAI_API_KEY') or getpass.getpass('OpenAI API key (hidden): ')).strip(); sys.exit(subprocess.call([sys.executable,'-m','streamlit','run','seo_agent.py','--server.address','127.0.0.1','--server.port','8502']))"
pause
