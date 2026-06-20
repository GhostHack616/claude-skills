#!/usr/bin/env python3
"""Template bypass Cloudflare / WAF
Usage : site protégé par Cloudflare ou un WAF.
À remplacer : URL, COOKIES (optionnel), CSS_SELECTOR.
"""
from scrapling.fetchers import StealthyFetcher

URL = "{{URL}}"
COOKIES = {{COOKIES}}  # None ou [{'name': ..., 'value': ..., 'domain': ..., 'path': '/'}]
CSS_SELECTOR = "{{CSS_SELECTOR}}"

page = StealthyFetcher.fetch(
    URL,
    headless=True,
    solve_cloudflare=True,
    cookies=COOKIES,
    timeout=60000,        # millisecondes pour les fetchers navigateur
    network_idle=True,
)

print(f"Status: {page.status}")

if CSS_SELECTOR:
    for r in page.css(CSS_SELECTOR).getall():
        print(r)
else:
    print(page.get_all_text(strip=True)[:2000])
