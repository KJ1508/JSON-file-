@echo off
setlocal
cd /d "%~dp0"
set "taskPython=python"
if exist "..\..\work\week5day1\.venv\Scripts\python.exe" set "taskPython=..\..\work\week5day1\.venv\Scripts\python.exe"
if exist ".venv\Scripts\python.exe" set "taskPython=.venv\Scripts\python.exe"
set "PYTHONIOENCODING=utf-8"
"%taskPython%" -c "import os,getpass,runpy; os.environ['OPENAI_API_KEY']=(os.getenv('OPENAI_API_KEY') or getpass.getpass('OpenAI API key (hidden): ')).strip(); runpy.run_path('hr_agent.py',run_name='__main__')"
pause
