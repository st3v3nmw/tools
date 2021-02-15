import requests
import json

def write_to_file(url: str, file_name: str):
    with open(file_name, 'w', encoding='utf-8') as f:
        json.dump(requests.get(url).json(), f, ensure_ascii=False, indent=4)

write_to_file("https://codeforces.com/api/problemset.problems", "problems.json")
write_to_file("https://codeforces.com/api/user.status?handle=st3v3n", "submissions.json")