FROM python:3.7.8-buster
WORKDIR /app

# Grab and setup the NN repo
RUN git clone https://github.com/xaroth8088/char-rnn.git .
RUN git checkout 1fce629
RUN pip install -r requirements.txt
RUN rm -rf data/shakespeare

# Layer this repo on top and set it up
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
RUN rm -rf /root/.cache/pip

CMD ["python", "__main__.py"]
