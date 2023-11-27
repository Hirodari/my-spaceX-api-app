FROM python:3.11.6-alpine 

WORKDIR /app 

COPY . .

RUN pip install  -r requirements.txt
EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]