import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

# Define the base URL and the list of relative URLs to scrape
base_url = 'http://www.plan.pwsz.legnica.edu.pl/'
urls = ['schedule_view.php?site=show_kierunek.php&id=7']

# Loop over the URLs and scrape data from each page
with open("URLs_zdrikul.txt", "w") as f:
    for url in urls:
        full_url = urljoin(base_url, url)
        grab = requests.get(full_url)
        soup = BeautifulSoup(grab.text, 'html.parser')
        
        # traverse paragraphs from soup
        for link in soup.find_all("a"):
            data = link.get('href')
            full_link = urljoin(base_url, data)
            f.write(full_link)
            f.write("\n")
