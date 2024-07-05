import os
import requests
from bs4 import BeautifulSoup
import pandas as pd

# 초록마을 재료 설명 크롤링

# 상품별 코드 배열
product_codes = [
    # 상품 코드 배열 (일부 빈 문자열 포함)
    'WG027192', 'WG002243', 'WG027317', 'WG026027', 'WG027772', 'WG018531', 'WG026623', 'WG023765', 'WG017102', 'WG018359', 'WG005108', 'WG023766', 'WG010993',
    '', '', 'WG016273', '', 'WG002247', 'WG023776', 'WG002236', 'WG027429', 'WG027902', 'WG003936', 'WG002181', '', 'WG012616', 'WG023767', '', '',
    'WG011002', '', 'WG000223', 'WG026635', 'WG027710', 'WG027205', 'WG026530', 'WG017923', 'WG017924', 'WG025321', '', 'WG027360', '', 'WG027591', 'WG027357', 'WG027579', '', 'WG023661', 'WG026783', '', '', 'WG027586', '', '', 'WG026786', '', '',
    'WG026914', '', 'WG025669', 'WG017284', 'WG010423', '', '', 'WG026558', '', '', 'WG026416', 'WG026715', 'WG025203', '', 'WG023480', 'WG026534', 'WG026779', 'WG027606', 'WG022195', 'WG022813', '', 'WG017157', '', '', 'WG026790', '', '',
    'WG024605', 'WG022142', '', '', '', 'WG023935', '', '', '', '', '', 'WG003094', '', '', '', '', '', 'WG026031', 'WG026277', 'WG023541', 'WG026767', 'WG025723', '', '', '', 'WG024464', '', 'WG012746', '', '', '', 'WG027757', 'WG012746', 'WG027556', '', 'WG015597', '', '', '', '', 'WG024454', '', '', '', '', '', 'WG027248', 'WG018614', '', 'WG024663', '', '', '', 'WG024477', '', 'WG004681', '', '', 'WG025849', '', '', '', '', '', '', 'WG016807', 'WG026947', '', 'WG003078', 'WG003078', 'WG025559', 'WG016859', 'WG025239', 'WG024703', '', 'WG015025', 'WG025242', 'WG027549', '', 'WG015896', 'WG027767', '', '', 'WG026787', '', 'WG016495', '', '', '', '', 'WG026781', '', 'WG027606', 'WG028045', 'WG023671', '', '', '', ''
]

# 엑셀 파일을 저장할 경로 및 파일명
folder_path = 'choroc-ingre-content'
excel_file = 'choroc-ingre-content/choroc_ingre_content.xlsx'

# ingre-content 폴더가 없으면 생성
if not os.path.exists(folder_path):
    os.makedirs(folder_path)
    print(f'{folder_path} 폴더가 생성되었습니다.')

# 엑셀 파일에 저장할 데이터를 담을 리스트
data = []

# 각 상품별로 크롤링 실행
for code in product_codes:
    if code.strip():  # 코드가 빈 문자열이 아닌 경우에만 크롤링 시도
        url = f'https://www.choroc.com/goods/{code}'
        response = requests.get(url)

        if response.status_code == 200:
            soup = BeautifulSoup(response.text, 'html.parser')

            # h3 태그와 p 태그 크롤링
            h3_tag = soup.find('div', class_='description_sec').find('h3').text.strip()
            p_tag = soup.find('div', class_='description_sec').find('p').text.strip()

            # 데이터 리스트에 추가
            data.append([code, h3_tag, p_tag])
        else:
            print(f'Failed to retrieve data for product code: {code}')
            # 크롤링 실패 시 빈 값 추가
            data.append([code, '', ''])
    else:
        # 코드가 빈 문자열일 경우 빈 값 추가
        data.append([code, '', ''])

# 데이터를 DataFrame으로 변환
df = pd.DataFrame(data, columns=['choroc_ingre_code', 'choroc_ingre_name', 'choroc_ingre_content'])

# 엑셀 파일로 저장
df.to_excel(excel_file, index=False)

print(f'크롤링 데이터를 엑셀 파일({excel_file})로 저장했습니다.')
