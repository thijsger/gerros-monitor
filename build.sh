#!/bin/sh
# Maakt index.html (standalone, voor gerros.nl) uit site.html (artifact-bron).
cd "$(dirname "$0")" || exit 1
{
  printf '<!doctype html>\n<html lang="nl">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  printf '<link rel="canonical" href="https://gerros.nl/">\n<meta property="og:type" content="website">\n<meta property="og:locale" content="nl_NL">\n<meta property="og:url" content="https://gerros.nl/">\n<meta property="og:title" content="GerrOS Monitor">\n<meta property="og:description" content="Monitoringsoftware voor overheden: partners leveren gegevens aan via één portaal, de monitor controleert ze en zet ze in een dashboard.">\n'
  grep -v "claude:viewport-fit-sides" site.html | awk '/^<header class="top">/{print "<style>body{margin:0}</style>\n</head>\n<body>"} {print}'
  printf '</body>\n</html>\n'
} > index.html
