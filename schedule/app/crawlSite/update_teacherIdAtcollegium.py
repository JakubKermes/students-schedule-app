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
with open('teachersURLs.txt', 'r') as f:
    urls = [line.strip() for line in f if line.strip()]

for url in urls:
    if "checkNauczycielWszys" in url:

        # Send a GET request to the URL
        response = requests.get(url)

        # Parse the HTML content of the page using BeautifulSoup
        soup = BeautifulSoup(response.content, 'html.parser')

        # Find the <h1> tag with the text "Nauczyciel :"
        h1_tag = soup.find('h1', text='Nauczyciel :')

        # Get the next <h2> tag and its text
        h2_tag = h1_tag.find_next('h2')
        teacher_name = h2_tag.get_text(strip=True)
        parsed_url = urllib.parse.urlparse(url)
        teacher_id = urllib.parse.parse_qs(parsed_url.query)['pracownik'][0]
        name_split = teacher_name.split()
        if len(name_split) >= 2 and name_split[-1] and name_split[-2]:


            query = f"UPDATE lecturers SET id_at_collegiumwitelona = {teacher_id} WHERE name = '{name_split[-2]}' AND lastname = '{name_split[-1]}'"
            db.execute(query)

            # Commit the changes to the database
            mydb.commit()
            print(name_split[-1])

input("Press any key to exit.")
