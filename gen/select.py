import json
import random

problems = json.load(open("problems.json", "r"))["result"]["problems"]
submissions = json.load(open("submissions.json", "r"))["result"]
data, tags = {}, {}

all_count = 0
for problem in problems:
    key = f"{problem['contestId']}{problem['index']}"
    rating = problem['rating'] if 'rating' in problem else 0
    data[key] = {'tags': problem['tags'], 'rating': rating, 'solved': False, 'title': problem['name']}

    for tag in problem['tags']:
        if not tag in tags:
            tags[tag] = {'all_count': 0, 'done_count': 0, 'rating_done': 0, 'attempts': 0, 'problems': {}}
        tags[tag]['all_count'] += 1
        all_count += 1
        if rating not in tags[tag]['problems']:
            tags[tag]['problems'][rating] = []
        tags[tag]['problems'][rating].append(key)

done_count = 0
for submission in submissions:
    key = f"{submission['contestId']}{submission['problem']['index']}"

    if not data[key]['solved']:
        data[key]['solved'] = submission['verdict'] == "OK"

        if data[key]['rating'] > 0:
            if data[key]['solved']:
                for tag in data[key]['tags']:
                    tags[tag]['done_count'] += 1
                    done_count += 1
                    tags[tag]['rating_done'] += data[key]['rating']  
            for tag in data[key]['tags']:
                tags[tag]['attempts'] += 1
    else:
        for tag in data[key]['tags']:
            tags[tag]['attempts'] += 1

deltas = []
for tag in tags:
    tags[tag]['rating_done'] = tags[tag]['rating_done'] / tags[tag]['done_count'] if tags[tag]['done_count'] > 0 else 800
    tags[tag]['all_count'] /= all_count
    tags[tag]['attempts'] = tags[tag]['attempts'] / tags[tag]['done_count'] if tags[tag]['done_count'] > 0 else 0
    tags[tag]['done_count'] /= done_count
    tags[tag]['done_count'] = tags[tag]['done_count'] / tags[tag]['attempts'] if tags[tag]['attempts'] > 0 else 0
    deltas.append([tag, round(tags[tag]['done_count'] - tags[tag]['all_count'], 4), round((tags[tag]['rating_done'] + 150) / 100) * 100])

deltas.sort(key=lambda x: x[1])
deltas = deltas[:4]
random.shuffle(deltas)
total = 0
for i in range(len(deltas)):
    total += deltas[i][1]
    deltas[i][1] *= -1
total *= -1

todo = {'batch_average': 0}
for i in range(len(deltas)):
    deltas[i][1] = round(deltas[i][1] / total * 16)
    while deltas[i][1] > 0:
        print(deltas[i])
        try:
            r = random.choices(tags[deltas[i][0]]['problems'][deltas[i][2]])[0]
        except Exception:
            deltas[i][2] += 100
            continue
        if not data[r]['solved']:
            todo[f"https://codeforces.com/contest/{r[:-1]}/problem/{r[-1]}"] = data[r]['title']
            deltas[i][1] -= 1
            tags[deltas[i][0]]['problems'][deltas[i][2]].remove(r)
            todo['batch_average'] += deltas[i][2]

todo['batch_average'] /= (len(todo) - 1)
with open("todo.json", 'w', encoding='utf-8') as f:
        json.dump(todo, f, ensure_ascii=False, indent=4)