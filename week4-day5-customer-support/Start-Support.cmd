@echo off
setlocal
cd /d "%~dp0"
set "taskPython=python"
if exist "..\..\work\day3\.venv\Scripts\python.exe" set "taskPython=..\..\work\day3\.venv\Scripts\python.exe"
if exist ".venv\Scripts\python.exe" set "taskPython=.venv\Scripts\python.exe"
set "PYTHONIOENCODING=utf-8"
set "CREWAI_TRACING_ENABLED=false"
set "STREAMLIT_BROWSER_GATHER_USAGE_STATS=false"
"%taskPython%" -c "import os,getpass,subprocess,sys; os.environ['OPENAI_API_KEY']=(os.getenv('OPENAI_API_KEY') or getpass.getpass('OpenAI API key (hidden): ')).strip(); os.environ['SERPER_API_KEY']=(os.getenv('SERPER_API_KEY') or getpass.getpass('Serper API key (hidden): ')).strip(); sys.exit(subprocess.call([sys.executable,'-m','streamlit','run','app.py','--server.address','127.0.0.1','--server.port','8501']))"
pause
