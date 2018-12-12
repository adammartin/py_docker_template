ARG base_image

FROM $base_image

WORKDIR /app
COPY ./app /app

RUN pip install --trusted-host pypi.python.org -r requirements.txt
