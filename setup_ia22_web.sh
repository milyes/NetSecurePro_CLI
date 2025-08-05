#!/bin/bash
echo "📦 Installation de l'interface IA22 DZERO..."

mkdir -p interface && cd interface

cat <<EOF > logic_cover.html
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>IA22 DZERO – Interface IA</title>
  <style>
    body {
      background-color: #0f0f0f;
      color: #ffffff;
      font-family: 'Segoe UI', sans-serif;
      padding: 2rem;
      max-width: 800px;
      margin: auto;
    }
    h1 {
      color: #66ffcc;
      text-align: center;
    }
    input[type="text"] {
      width: 100%;
      padding: 1rem;
      font-size: 1rem;
      border-radius: 0.5rem;
      border: none;
      margin-bottom: 1rem;
    }
    button {
      background-color: #66ffcc;
      color: #000000;
      padding: 0.8rem 1.5rem;
      font-size: 1rem;
      border: none;
      border-radius: 0.5rem;
      cursor: pointer;
    }
    button:hover {
      background-color: #55e6b3;
    }
    pre {
      background-color: #1a1a1a;
      padding: 1rem;
      border-radius: 0.5rem;
      margin-top: 1rem;
      white-space: pre-wrap;
    }
  </style>
</head>
<body>
  <h1>🧠 IA22 DZERO – Interface Web</h1>
  <form onsubmit="runIA(); return false;">
    <input type="text" id="prompt" placeholder="Entrez votre prompt ici...">
    <button type="submit">Lancer l'IA</button>
  </form>
  <pre id="output">Réponse IA : en attente...</pre>

  <script>
    async function runIA() {
      const prompt = document.getElementById("prompt").value;
      document.getElementById("output").textContent = "⏳ Traitement...";
      try {
        const response = await fetch(\`/run?prompt=\${encodeURIComponent(prompt)}\`);
        const result = await response.text();
        document.getElementById("output").textContent = "📤 " + result;
      } catch (err) {
        document.getElementById("output").textContent = "❌ Erreur : " + err;
      }
    }
  </script>
</body>
</html>
EOF

echo "✅ Interface créée : interface/logic_cover.html"

# Lancement automatique
cd ..
echo "🌐 Démarrage du serveur HTTP local..."
python3 -m http.server 7860 &
termux-open-url http://127.0.0.1:7860/interface/logic_cover.html



