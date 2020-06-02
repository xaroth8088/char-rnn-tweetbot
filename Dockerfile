FROM python:3.7.7-buster
WORKDIR /app

# Grab and setup the NN repo
RUN git clone https://github.com/xaroth8088/char-rnn.git .
RUN git checkout 9b4910d
RUN pip install -r requirements.txt
RUN rm -rf data/shakespeare

# Layer this repo on top and set it up
COPY . .
RUN pip install -r requirements.txt

CMD ["python", "__main__.py"]
