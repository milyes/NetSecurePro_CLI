#!/bin/bash
echo "🌐 Lancement interface Web IA..."
python3 -m http.server 7860
termux-open-url http://127.0.0.1:7860/interface/logic_cover.html
