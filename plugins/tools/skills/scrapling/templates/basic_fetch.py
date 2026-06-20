#!/usr/bin/env python3
"""Template HTTP de base
Usage : page statique, sans rendu JS, sans protection anti-bot.
À remplacer : URL, CSS_SELECTOR, logique de sortie.
"""
from scrapling.fetchers import Fetcher

URL = "{{URL}}"
CSS_SELECTOR = "{{CSS_SELECTOR}}"  # ex: '.article h1::text'

page = Fetcher.get(URL, impersonate='chrome', timeout=30)
print(f"Status: {page.status}")

if CSS_SELECTOR:
    for r in page.css(CSS_SELECTOR).getall():
        print(r)
else:
    print(page.get_all_text(strip=True)[:2000])
