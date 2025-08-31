#Task 3. Опционально)
def calculate_average_score(scores,  ignore_lowest=False):
    new_scores=scores.copy() #скопируем список, чтобы не испортить
    if ignore_lowest==True and len(new_scores)>1:
        new_scores.remove(min(new_scores)) #проверяем и удаляем минимальный
    if new_scores: 
        average= sum(new_scores)/len(new_scores)  #если список не пустой, считаем средне
        return average
    else:
        return "Список пуст"

student_data = [ {'name': 'Алексей', 'scores': [85, 92, 78, 95]}, {'name': 'Марина', 'scores': [65, 70, 58, 82]},{'name': 'Светлана', 'scores': [98, 95, 100]} ]

print("Средний балл со всеми оценками:")
for person in student_data: 
    average= calculate_average_score(person['scores'], False)  #достаем список по ключу из словаря person, который внутри списка student_data
    print(f"Имя: {person['name']}, балл: {average}")

print("Средний балл без минимальной: ")
for person in student_data:
    average= calculate_average_score(person['scores'], True)
    print(f"Имя: {person['name']}, балл: {average}")