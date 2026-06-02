#!/usr/bin/env python3
"""Fetch a YouTube transcript as clean plain text.

Usage: yt_transcript.py <youtube-url-or-id> [lang]

Prints the transcript to stdout, or an explanatory error to stderr.
Requires: youtube-transcript-api (pinned 0.6.2 by the calling skill).
"""
import re
import sys


def extract_id(s: str):
    s = s.strip()
    m = re.search(r'(?:v=|youtu\.be/|/shorts/|/embed/|/live/)([A-Za-z0-9_-]{11})', s)
    if m:
        return m.group(1)
    if re.fullmatch(r'[A-Za-z0-9_-]{11}', s):
        return s
    return None


def main():
    if len(sys.argv) < 2:
        print("usage: yt_transcript.py <youtube-url-or-id> [lang]", file=sys.stderr)
        sys.exit(2)

    vid = extract_id(sys.argv[1])
    if not vid:
        print("ERROR: impossible de parser un ID vidéo YouTube valide.", file=sys.stderr)
        sys.exit(2)

    langs = [sys.argv[2]] if len(sys.argv) > 2 else ['fr', 'en', 'en-US', 'en-GB']

    try:
        from youtube_transcript_api import YouTubeTranscriptApi
    except ImportError:
        print("ERROR: dépendance manquante. Installe d'abord: pip install youtube-transcript-api==0.6.2",
              file=sys.stderr)
        sys.exit(3)

    data = None
    try:
        data = YouTubeTranscriptApi.get_transcript(vid, languages=langs)
    except Exception:
        # Fallback: prends n'importe quelle piste disponible (manuelle ou auto, traduite si besoin)
        try:
            tl = YouTubeTranscriptApi.list_transcripts(vid)
            chosen = None
            for tr in tl:
                chosen = tr
                if not tr.is_generated:
                    break
            if chosen is None:
                raise RuntimeError("aucune piste de sous-titres")
            data = chosen.fetch()
        except Exception as e:
            print(f"ERROR: pas de transcript récupérable pour cette vidéo ({e}).", file=sys.stderr)
            sys.exit(1)

    text = " ".join(seg['text'].replace('\n', ' ') for seg in data if seg.get('text', '').strip())
    text = re.sub(r'\s+', ' ', text).strip()
    if not text:
        print("ERROR: transcript vide.", file=sys.stderr)
        sys.exit(1)
    print(text)


if __name__ == '__main__':
    main()
