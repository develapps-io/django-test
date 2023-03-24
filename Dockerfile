# pull official base image
FROM python:3.8

WORKDIR /app/
ARG POETRY_VERSION=1.4.0
ARG POETRY_HOME="/root/poetry"
ARG POETRY_DEPS="--no-dev"
ENV PIP_DISABLE_PIP_VERSION_CHECK=on
ENV PATH=$PATH:$POETRY_HOME/bin


COPY poetry.lock pyproject.toml /app/

RUN curl -sSL https://install.python-poetry.org | POETRY_VERSION=$POETRY_VERSION POETRY_HOME=$POETRY_HOME python -

RUN poetry config virtualenvs.create false && poetry install $POETRY_DEPS
#
COPY . .

EXPOSE 8000
RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
