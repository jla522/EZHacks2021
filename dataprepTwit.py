from dataprep.connector import connect
import asyncio # Non Jupyter 
import json

twitterApiKey = "o4CpulONFUh5Bm34MQ7l2mNEg"
twitterApiSecretKey = "QHrDRZiGrSDfKhA5UwI31tHyEBaULKHmF0QlwCFvR5MQ6MyTQU"
dataprepConnector = connect('twitter', _auth={'client_id': twitterApiKey, 'client_secret': twitterApiSecretKey})

# Querying 100 tweets from @SFU from this month
loop = asyncio.get_event_loop()
df = loop.run_until_complete(
    dataprepConnector.query(
        "tweets", 
        _q="from:@SFU -is:retweet", 
        _count=100 # idk what this is
    )
)

# Displaying latest 10 tweets
# df = df.head(10)
df = df[["created_at", "text"]]

dictOfdf = df.to_dict()
with open('data.json', 'w') as outfile:
    json.dump(dictOfdf, outfile)

import cv2
im = cv2.imread('background.png', 1)
font = cv2.FONT_HERSHEY_SIMPLEX
cv2.putText(im, 'Christmas', (10,450), font, 3, (0, 255, 0), 2, cv2.LINE_AA)
cv2.imwrite(path + 'pillar_text.jpg', im)
