#!/bin/sh
# Lädt diesen Mail-Ordner hoch, aber nur, wenn jede Datei aus bereits verschickten Mails noch im Ordner liegt (Versand-Schutz).
# Nach dem Versand einer neuen Mail: versand_schutz.py merken <index.html> --projekt … --datum … --an … (dann ist auch sie geschützt).
set -e
cd "$(dirname "$0")"
python3 "$HOME/Versand-Schutz/versand_schutz.py" pruefen .
npx --yes vercel@latest deploy --prod --yes
python3 "$HOME/Versand-Schutz/versand_schutz.py" live
