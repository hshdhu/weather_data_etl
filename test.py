import requests

url = "https://api.openweathermap.org/data/2.5/weather"
params = {
    "q": "Hanoi,VN",
    "appid": "1e476ff01e699d286c30593630580611",
    "units": "metric"
}

print("👉 Đang gửi request...")
r = requests.get(url, params=params)

print("Status:", r.status_code)
print("Response:", r.text)
