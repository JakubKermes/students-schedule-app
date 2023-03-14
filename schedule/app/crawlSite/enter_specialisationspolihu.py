from curses import qiflush
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
with open('URLs_spolihu.txt', 'r') as f:
    urls = [line.strip() for line in f if line.strip()]

for url in urls:
    if "checkSpecjalnosc.php" in url:

        parsed_url = urllib.parse.urlparse(url)
        specialisation = urllib.parse.parse_qs(parsed_url.query)['specjalnosc'][0]
        
        stationary = 0 if specialisation[0]=='n' else 1
        year = specialisation[1]
        specialisation_only = specialisation[2:]
        response = requests.get('http://www.plan.pwsz.legnica.edu.pl/schedule_view.php?site=show_kierunek.php&id=2')
        soup = BeautifulSoup(response.content, 'html.parser')
        name = soup.find('a', href=lambda href: href and 'specjalnosc={}'.format(specialisation) in href).text.strip().split(' (')[1]
        name = name[:-1]
        query = f"INSERT INTO field_of_study (id_faculty, fos, year, stationary, specialisation) VALUES (2, '{name}', {year}, {stationary}, '{specialisation_only}')"
        db.execute(query)


input(name)
