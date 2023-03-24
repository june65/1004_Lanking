
import urllib
import json
from urllib import parse
from urllib.request import Request, urlopen
from random import randrange
from bs4 import BeautifulSoup
from korean_name_generator import namer

users = []

# male_count와 female_count를 설정해주세요.
male_names = []
male_count = 50
female_names = []
female_count = 50

while len(male_names) < male_count:
    name = namer.generate(True)
    if name not in male_names:
        male_names.append(name)

while len(female_names) < female_count:
    name = namer.generate(False)
    if name not in female_names:
        female_names.append(name)

# 한글이름을 영어로 번역할 주소
naver_url = 'https://dict.naver.com/name-to-roman/translation/?query='


def get_eng_name(name):
    """ 한글이름을 영어로 번역하는 함수 """
    name_url = naver_url + urllib.parse.quote(name)

    req = Request(name_url)
    res = urlopen(req)

    html = res.read().decode('utf-8')
    bs = BeautifulSoup(html, 'html.parser')
    # Beautiful Soup를 사용해 Selector로 영문 이름 획득
    name_tags = bs.select('#container > div > table > tbody > tr > td > a')
    names = [name_tag.text for name_tag in name_tags]

    if len(names) == 0:
        return 'username'

    return names[0]


if male_count > 0:
    for i, male_name in enumerate(male_names):
        male = {}
        male['id'] = i + 1
        male['name'] = male_name
        male['gender'] = 'M'
        # 10대 - 50대에 걸쳐 생성되도록 age 설정
        male['age'] = 10 + 10 * int(i / (male_count/5)) + randrange(10)
        try:
            male['username'] = get_eng_name(
                male_name).lower().replace(' ', '.') + '{:04d}'.format(i + 1)
        except:
            male['username'] = 'username' + '{:04d}'.format(i + 1)
        male['email'] = male['username'] + '@example.com'
        users.append(male)

        print(male['username']+male['gender'])

if female_count > 0:
    for i, female_name in enumerate(female_names):
        female = {}
        female['id'] = i + male_count + 1
        female['name'] = female_name
        female['gender'] = 'F'
        female['age'] = 10 + 10 * int(i / (female_count/5)) + randrange(10)
        try:
            female['username'] = get_eng_name(
                female_name).lower().replace(' ', '.') + '{:04d}'.format(i + male_count + 1)
        except:
            female['username'] = 'username' + '{:04d}'.format(i + 1)
        female['email'] = female['username'] + '@example.com'
        users.append(female)

        print(female['username'])

with open('user_data.json', 'w', encoding='UTF-8') as json_file:
    json.dump(users, json_file, ensure_ascii=False)