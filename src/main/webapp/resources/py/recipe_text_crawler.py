from bs4 import BeautifulSoup
import requests
import os
import pandas as pd
import re

# 오뚜기 오키친 웹사이트 텍스트 크롤링 및 엑셀 파일 저장 함수
def crawl_text_and_save_to_excel(query):
    # 크롤링할 기본 URL 설정
    base_url = 'https://ottogi.okitchen.co.kr/category/detail?idx='
    url = base_url + query
    headers = {'User-Agent': "Mozilla/5.0"}
    response = requests.get(url, headers=headers)
    soup = BeautifulSoup(response.content, 'html.parser')

    # ContentArea 클래스가 있는 div 내 텍스트 크롤링
    content_area = soup.find('div', class_='ContentArea')
    if content_area:
        # 텍스트를 담을 리스트 초기화
        text_list = []

        # 모든 p 태그를 찾아서 텍스트 추출
        paragraphs = content_area.find_all('p')
        for p in paragraphs:
            # '만드는 방법'이라는 텍스트가 포함되지 않고, 'Step 숫자'와 같은 패턴이 포함되지 않을 때만 추가
            text = p.get_text().strip()
            if '만드는 방법' not in text and not text.startswith('Step ') and not text.startswith('스텝 '):
                text_list.append(text)

        # '|'로 구분된 하나의 문자열로 결합
        result_text = '|'.join(text_list).strip('|')
        result_text = re.sub(r'\|+', '|', result_text)  # 연속된 '|'를 하나로 합침
        print(f"Extracted text from {url}: {result_text}")

        # 엑셀 파일로 저장
        save_to_excel(query, result_text)

def save_to_excel(recipe_idx, recipe_content):
    """
    주어진 레시피 ID와 레시피 내용을 받아서 엑셀 파일에 저장하는 함수입니다.

    Parameters:
    - recipe_idx (str): 레시피 ID
    - recipe_content (str): 레시피 내용

    Returns:
    - None
    """
    # 폴더 경로 설정
    folder_name = 'okitchen-text'
    folder_path = os.path.join(os.getcwd(), folder_name)

    # 폴더가 없으면 생성
    if not os.path.exists(folder_path):
        os.makedirs(folder_path)

    # 엑셀 파일 경로 설정
    excel_file = os.path.join(folder_path, 'okitchen-recipe_content.xlsx')

    # DataFrame 생성
    data = {'recipe_idx': [recipe_idx], 'recipe_content': [recipe_content]}
    df = pd.DataFrame(data)

    # 기존 엑셀 파일이 있는지 체크하여 기존 데이터에 추가
    if os.path.exists(excel_file):
        existing_df = pd.read_excel(excel_file)
        df = pd.concat([existing_df, df], ignore_index=True)

    # DataFrame을 엑셀 파일로 저장
    df.to_excel(excel_file, index=False)
    print(f"Data saved to {excel_file}")

# 크롤링할 레시피 ID 리스트
recipes = ["1047"]

# 각 레시피 ID에 대해 텍스트 크롤링 및 엑셀 저장 실행
for recipe_idx in recipes:
    crawl_text_and_save_to_excel(recipe_idx)
