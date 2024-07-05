from bs4 import BeautifulSoup
import requests
import os
from urllib.parse import urljoin
import time


# 오뚜기 오키친 웹사이트 이미지 크롤링 함수
def download_images(query):
    # 크롤링할 기본 URL 설정
    base_url = 'https://ottogi.okitchen.co.kr/category/detail?idx='
    url = base_url + query
    headers = {'User-Agent': "Mozilla/5.0"}

    # URL에 요청을 보내고 HTML 컨텐츠를 가져온다
    response = requests.get(url, headers=headers)
    soup = BeautifulSoup(response.content, 'html.parser')

    # 이미지 파일을 저장할 폴더 경로 설정 (없으면 생성)
    img_folder = os.path.join(os.getcwd(), 'img')
    if not os.path.exists(img_folder):
        os.makedirs(img_folder)

    # 페이지의 두 번째 이미지를 {query}_title.jpg로 저장
    images = soup.find_all('img')
    if len(images) > 1:
        img_url = urljoin(url, images[1].get('src'))
        img_extension = img_url.split('.')[-1]
        file_name = f'{query}_title.{img_extension}'
        file_path = os.path.join(img_folder, file_name)

        # 파일이 이미 존재하지 않는 경우에만 다운로드 시도
        if not os.path.exists(file_path):
            try:
                img_response = requests.get(img_url, timeout=5)
                img_response.raise_for_status()
                with open(file_path, 'wb') as file:
                    file.write(img_response.content)
                print(f"Image downloaded and saved as {file_path}")
            except requests.exceptions.RequestException as e:
                print(f"Failed to download {img_url}: {e}")
            # 각 요청 간에 1초 대기
            time.sleep(1)

    # ContentArea 클래스가 있는 div 내의 이미지 다운로드
    content_area = soup.find('div', class_='ContentArea')
    if content_area:
        images = content_area.find_all('img')
        for idx, img in enumerate(images):
            img_url = urljoin(url, img.get('src'))
            img_extension = img_url.split('.')[-1]
            file_name = f'{query}_{idx + 1}.{img_extension}'
            file_path = os.path.join(img_folder, file_name)

            # 파일이 이미 존재하는 경우 다운로드를 건너뜀
            if os.path.exists(file_path):
                print(f"Image {file_path} already exists, skipping download.")
                continue

            # 각 이미지를 최대 3번 시도하여 다운로드
            for attempt in range(3):
                try:
                    img_response = requests.get(img_url, timeout=5)
                    img_response.raise_for_status()
                    break
                except requests.exceptions.RequestException as e:
                    print(f"Attempt {attempt + 1} failed for {img_url}: {e}")
                    time.sleep(2)
            else:
                print(f"Failed to download {img_url} after 3 attempts")
                continue

            # 이미지 파일을 로컬에 저장
            with open(file_path, 'wb') as file:
                file.write(img_response.content)
            print(f"Image downloaded and saved as {file_path}")

            # 각 요청 간에 1초 대기
            time.sleep(1)


# 크롤링할 레시피 ID 리스트
recipes = ["1047", "1054", "1056", "1071", "1111", "1156", "1213", "1247", "1261"]

# 각 레시피 ID에 대해 이미지 다운로드 실행
for recipe_idx in recipes:
    download_images(recipe_idx)
