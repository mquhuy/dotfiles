#!/usr/bin/env python3

import sys
import re
import subprocess
import os
from multiprocessing import Process
import logging

SITE_TO_BROWSER = {
    "github.com": "github",
    "eteamproject.ericsson.net": "kolmenakkia",
}

LOG_DIR = os.path.join(os.environ["HOME"], ".logs")
LOG_FILE = os.path.join(LOG_DIR, "browser.log")

os.makedirs(LOG_DIR, exist_ok=True)

# Configure the logging
logging.basicConfig(filename=LOG_FILE, level=logging.DEBUG,
                    format='%(asctime)s - %(levelname)s - %(message)s')

def open_url(browser, url):
    command = [browser, url]
    logging.debug("Running command: %s", " ".join(command))
    subprocess.run(command)

def clean_teams_url(url):
    teams_regex=r"https://statics\.teams\.cdn\.office\.net/evergreen-assets/safelinks/(?:.*)\?url\=(?P<url>.*?)&"
    match = re.search(teams_regex, url)
    if match is None:
        return url
    new_url = match.group("url")
    new_url = new_url.replace("%3A", ":").replace("%2F", "/")
    return new_url

def get_base_site(url):
    regex = r"(http|https)://(?P<site>.*?)/"
    match = re.search(regex, url)
    if match is None:
        return url
    return match.group("site")

def main(url):
    url = clean_teams_url(url)
    logging.debug("You clicked on url: %s", url)
    # browser = "brave-browser"
    site = get_base_site(url)
    logging.debug("Url site: %s", site)
    # if url.startswith("https://"):
        # browser = "github"
    browser = SITE_TO_BROWSER.get(site, "brave-browser")
    logging.debug("Browser to use: %s", browser)
    print(browser)
    # p = Process(target=open_url, args=(browser, url))
    # p.start()
    # os._exit(0)

if __name__ == "__main__":
    main(sys.argv[1])
