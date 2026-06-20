#!/usr/bin/env python3
"""Template parsing HTML seul (pas besoin des dépendances fetchers)
Usage : HTML déjà récupéré (via WebFetch, fichier, API), juste à parser/extraire.
À remplacer : HTML_SOURCE, BASE_URL, CSS_SELECTOR.
"""
from scrapling.parser import Selector

HTML_SOURCE = """{{HTML}}"""
# ou depuis un fichier : HTML_SOURCE = open('page.html').read()

page = Selector(HTML_SOURCE, url='{{BASE_URL}}')

for item in page.css('{{CSS_SELECTOR}}'):
    print(item.get_all_text(strip=True))
