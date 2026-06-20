#!/usr/bin/env python3
"""Template session avec login + multi-pages
Usage : pages accessibles seulement après login, en HTTP (formulaire, pas de login JS).
À remplacer : LOGIN_URL, LOGIN_DATA, TARGET_URLS.
"""
from scrapling.fetchers import FetcherSession

LOGIN_URL = "{{LOGIN_URL}}"
LOGIN_DATA = {{LOGIN_DATA}}    # {'username': '...', 'password': '...'}
TARGET_URLS = {{TARGET_URLS}}  # ['https://site.com/page1', ...]

with FetcherSession(impersonate='chrome') as s:
    login_resp = s.post(LOGIN_URL, data=LOGIN_DATA)
    print(f"Login status: {login_resp.status}")

    for url in TARGET_URLS:
        page = s.get(url)
        print(f"\n--- {url} (status: {page.status}) ---")
        print(page.get_all_text(strip=True)[:1000])
