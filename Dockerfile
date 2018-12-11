FROM ebondark/babelfish-base

WORKDIR /app
COPY ./app /app

RUN pip install --trusted-host pypi.python.org -r requirements.txt
