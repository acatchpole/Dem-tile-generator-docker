FROM python:3.9.21-bookworm

WORKDIR /usr/src/app

COPY sources.list /etc/apt/sources.list

RUN apt-get update; \
    apt-get install -y python-dev-is-python3; \
    apt-get install -y libgdal-dev; \
    apt-get install -y git; \
    apt-get install -y pip; \
    pip install gdal==3.9; \
    apt-get install -y gdal-bin; \
    pip install rio-rgbify==0.3.2; \
    pip install argparse==1.4.0; \
    pip install pillow==8.0.1; \
    pip install tqdm==4.55.0;

RUN git clone https://github.com/watergis/dem2terrainrgb; \
    cd dem2terrainrgb; \
    pip install poetry;

WORKDIR /usr/src/app/dem2terrainrgb

COPY poetry.lock ./
COPY pyproject.toml ./
COPY bc_092b044_xl1m_utm10_2019.tif ./

RUN poetry install

CMD ["tail", "-f", "/dev/null"]
