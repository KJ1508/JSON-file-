@echo off
setlocal
cd /d "%~dp0"
set "taskPython=python"
if exist "..\..\work\day3\.venv\Scripts\python.exe" set "taskPython=..\..\work\day3\.venv\Scripts\python.exe"
if exist ".venv\Scripts\python.exe" set "taskPython=.venv\Scripts\python.exe"
set "PYTHONIOENCODING=utf-8"
"%taskPython%" -c "import os,getpass,runpy; os.environ['OPENAI_API_KEY']=os.getenv('OPENAI_API_KEY') or getpass.getpass('OpenAI API key (hidden): '); os.environ.setdefault('MODEL','openai/gpt-4o-mini'); runpy.run_path('travel_planner.py',run_name='__main__')"
pause
