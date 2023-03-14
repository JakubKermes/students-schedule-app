from pickle import FALSE, TRUE
import requests
from bs4 import BeautifulSoup
import mysql.connector
import urllib.parse

mydb = mysql.connector.connect(
  host="localhost",
  user="schedule_controll",
  password="controll",
  database="schedule"
)

db = mydb.cursor()

# Read the URLs from the file
with open('URLs.txt', 'r') as f:
    urls = [line.strip() for line in f if line.strip()]

for url in urls:
    if "checkSpecjalnosc" in url:

        parsed_url = urllib.parse.urlparse(url)
        specjalisation = urllib.parse.parse_qs(parsed_url.query)['specjalnosc'][0]
        
        stationary = False if specjalisation[0]==n else stationary = True
        year = specjalisation[1]
        specjalisation = specjalisation[2:]

     query = f"INSERT INTO field_of_study (fos)"


input("Press any key to exit.")
