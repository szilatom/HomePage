# SMBNexIT HomePage - Szerver indítás útmutató

## A probléma
A **"Failed to fetch"** hiba azért lép fel, mert a HTML fájl `file://` protokollról fut, és HTTPS API-hoz próbál kapcsolódni. A böngészők biztonsági okokból blokkolják ezeket a kéréseket.

## Megoldások

### 1. Automatikus szerver indítás (ajánlott)
Futtassa a `start-server.bat` fájlt dupla kattintással. Ez automatikusan:
- Megkeresi a megfelelő HTTP szervert
- Elindítja a 8080-as porton
- Megnyitja a böngészőt

### 2. Manuális szerver indítás

#### Node.js http-server
```bash
# Telepítés (egyszer)
npm install -g http-server

# Indítás
cd C:\Users\szila\Desktop\SMBNexIT\HomePage
http-server -p 8080 -o
```

#### Python HTTP szerver
```bash
# Python 3.x esetén
cd C:\Users\szila\Desktop\SMBNexIT\HomePage
python -m http.server 8080
```

#### NPX (Node.js package runner)
```bash
cd C:\Users\szila\Desktop\SMBNexIT\HomePage
npx http-server -p 8080 -o
```

### 3. VS Code Live Server
1. Telepítse a "Live Server" bővítményt VS Code-ban
2. Nyissa meg az `index.html` fájlt
3. Kattintson jobb gombbal → "Open with Live Server"

## Működés ellenőrzése
A szerver indítása után a weboldal elérhető lesz:
- **Manual indítás**: http://localhost:8080
- **VS Code Live Server**: http://127.0.0.1:5500/HomePage/index.html
- **Kontakt form**: Működik a https://localhost:7219 API-val (CORS megfelelően konfigurálva)

## Hibakezelés javítások
A JavaScript kód mostantól részletesebb hibakezelést tartalmaz:
- CORS hibák esetén útmutatást ad
- API hibák részletes logolása
- Felhasználóbarát hibaüzenetek

## Backend API szerver indítása (FONTOS!)
Az üzenet küldési funkció működéséhez a backend API szervernek futnia kell:

```bash
cd "C:\Users\szila\Desktop\SMBNexIT\SMBNexITHomeRestApi\SMBNexITHomeRestApi"
dotnet run --launch-profile https
```

Ez elindítja a szervert:
- **HTTPS**: https://localhost:7219 (ez kell a frontend-nek)
- **HTTP**: http://localhost:5173

## CORS beállítás
A backend most már támogatja a CORS kéréseket a következő origin-ekről:
- https://localhost:443
- http://localhost:8080 (manuális HTTP szerver)
- http://127.0.0.1:5500 (VS Code Live Server)