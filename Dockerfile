FROM python:3.7.8-buster
WORKDIR /app

# Grab and setup the NN repo
RUN git clone https://github.com/xaroth8088/char-rnn.git .
RUN git fetch
RUN git checkout 1fce6290b6c578a8a072e8d5a6a3ffebe5b5e250
RUN pip install -r requirements.txt
RUN rm -rf data/shakespeare

# Layer this repo on top and set it up
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
RUN rm -rf /root/.cache/pip

CMD ["python", "__main__.py"]
