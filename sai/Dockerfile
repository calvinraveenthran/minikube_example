FROM python:3.9
WORKDIR /code
COPY sai/requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
COPY sai/app /code/app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
