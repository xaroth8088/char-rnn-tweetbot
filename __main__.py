import tweepy
import configparser
import os


def main():
    # Get tweet text
    with os.popen(
            "python sample.py --data_dir data/checkpoint-to-tweet-from --temperature 0.25 --sample_len 280 | sed -E 's/[\\r\\n]+/\\n/g' | sed '2q;d'"
    ) as stream:
        output = stream.read()

    # Load config
    config = configparser.ConfigParser()
    config.read('config.ini')

    api = tweepy.Client(
        consumer_key=config['twitter_app']['consumer_key'],
        consumer_secret=config['twitter_app']['consumer_secret'],
        access_token=config['twitter_app']['access_token'],
        access_token_secret=config['twitter_app']['access_token_secret']
    )

    api.create_tweet(text=output)


if __name__ == "__main__":
    main()
