import requests
import pandas as pd
from datetime import datetime


url = "https://api.coingecko.com/api/v3/coins/bitcoin/market_chart"
params = {
    "vs_currency": "usd",
    "days": 7,
    "interval": "daily"
}

response = requests.get(url, params=params)
data = response.json()

precos = data["prices"]

df = pd.DataFrame(precos, columns=["timestamp", "price"])
df["date"] = pd.to_datetime(df["timestamp"], unit='ms').dt.strftime("%d/%m/%Y")
df = df[["date", "price"]]
df.columns = ["Data", "Preço (USD)"]

data_hoje = datetime.now().strftime("%d-%m-%Y")
nome_arquivo = f"bitcoin_{data_hoje}.xlsx"
df.to_excel(nome_arquivo, index=False)

