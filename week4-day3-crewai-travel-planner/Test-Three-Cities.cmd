@echo off
setlocal
cd /d "%~dp0"
set "taskPython=python"
if exist "..\..\work\day3\.venv\Scripts\python.exe" set "taskPython=..\..\work\day3\.venv\Scripts\python.exe"
if exist ".venv\Scripts\python.exe" set "taskPython=.venv\Scripts\python.exe"
set "PYTHONIOENCODING=utf-8"
"%taskPython%" -c "import os,getpass,subprocess,sys,pathlib; os.environ['OPENAI_API_KEY']=os.getenv('OPENAI_API_KEY') or getpass.getpass('OpenAI API key (hidden): '); os.environ.setdefault('MODEL','openai/gpt-4o-mini'); pathlib.Path('logs').mkdir(exist_ok=True); exec('for city in [\'Jaipur\',\'Chennai\',\'Paris\']:\n print(\'City: \'+city,flush=True)\n result=subprocess.run([sys.executable,\'travel_planner.py\'],input=city+chr(10),text=True,capture_output=True,encoding=\'utf-8\')\n print(result.stdout,flush=True)\n print(result.stderr,file=sys.stderr,flush=True)\n pathlib.Path(\'logs/\'+city+\'.txt\').write_text(\'City: \'+city+chr(10)+result.stdout+result.stderr,encoding=\'utf-8\')\n if result.returncode: sys.exit(result.returncode)')"
pause
