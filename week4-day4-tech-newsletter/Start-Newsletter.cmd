@echo off
setlocal
cd /d "%~dp0"
set "taskPython=python"
if exist "..\..\work\day3\.venv\Scripts\python.exe" set "taskPython=..\..\work\day3\.venv\Scripts\python.exe"
if exist ".venv\Scripts\python.exe" set "taskPython=.venv\Scripts\python.exe"
set "PYTHONIOENCODING=utf-8"
"%taskPython%" -c "import os,getpass,runpy; os.environ['OPENAI_API_KEY']=(os.getenv('OPENAI_API_KEY') or getpass.getpass('OpenAI API key (hidden): ')).strip(); os.environ['SERPER_API_KEY']=(os.getenv('SERPER_API_KEY') or getpass.getpass('Serper API key (hidden): ')).strip(); runpy.run_path('news_crew.py',run_name='__main__')"
pause
