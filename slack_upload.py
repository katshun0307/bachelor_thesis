# -*- coding: utf-8 -*- #

""" upload pdf file to slack
"""

import requests

SLACK_TOKEN = "xoxb-113938232944-850707824485-nOt3bYMz0rMcB9bHmK6gVcoe"
CHANNEL = 'CQMN6B1K6'

with open("thesis.pdf", 'rb') as f:
    files = {'file': f}
    param = {
        'token': SLACK_TOKEN,
        'channels': CHANNEL,
        'filename': "thesis.pdf",
        'initial_comment': "新しい卒論の version ができました.",
        'title': "New thesis update"
    }
    r = requests.post(url="https://slack.com/api/files.upload",
                      params=param, files=files)
    print(r.text)
